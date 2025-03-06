import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../viewmodel/restaurant/restaurant.id.dart';
import '../../helper/router.dart';
import '../miscellaneous/global.dialog.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() =>
      _ScannerState();
}

class _ScannerState
    extends State<Scanner> with WidgetsBindingObserver, ViewRouter, GlobalDialog {

  StreamSubscription<Object?>? _subscription;
  int a = 0;
  bool here = true;
  ValueNotifier<bool> needCam = ValueNotifier(false);
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    // torchEnabled: true,
    // autoZoom: true,
    // invertImage: true,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.barcodes.listen(_handleBarcode);
    unawaited(controller.start());
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.hasCameraPermission) {
      return;
    }
    
    switch (state) {
      case AppLifecycleState.resumed:
        // When the app resumes, restart the camera and re-establish subscriptions.
        // if (here == true) {
        //   _subscription = controller.barcodes.listen(_handleBarcode);
        // }
        // unawaited(controller.start());
        needCam.value = true;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        // When the app is inactive/paused/detached, cancel subscriptions and stop the camera.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
        break;
      case AppLifecycleState.hidden:
        // Optionally handle hidden state if needed.
        break;
    }
  }


  _handleBarcode(BarcodeCapture barcode){
    final values = barcode.barcodes.map((e) => e.displayValue).join(', ');
    if (a == 0){
      a = 1;
      needCam.value = false;
      if(values.isNotEmpty && values.contains("/")){
        controller.stop().then((v) {
          needCam.value = true;
          showAlertDialog(
            success: false,
            message: "Invalid data",
            buttonText: "Continue",
            onClose: () {
              Navigator.pop(context);
              // back();
              // Future.delayed(Duration(seconds: 5), (){
              a = 0;
              // });
              
            },
          );
        });
        
      }else {

        // controller.pause();
        controller.stop().then((v) {
          here == false;
          needCam.value = true;
          a = 0;
          goto('/nikita/restaurant/$values');
        });
        
      }
    }
  }

  ValueNotifier scannedValue = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: needCam, 
        builder: (context, value, child) => needCam.value == true ? FloatingActionButton(
          child: Icon(Icons.qr_code_scanner),
          onPressed: (){
            _subscription = controller.barcodes.listen(_handleBarcode);
            unawaited(controller.start());
            needCam.value=false;
        }): const SizedBox(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: MobileScanner(
                controller: controller,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    WidgetsBinding.instance.removeObserver(this);
    // unawaited(_subscription?.cancel());
    await _subscription!.cancel();
    _subscription = null;
    await controller.stop();
    await controller.dispose();
    super.dispose();
  }
}



// class ScannedBarcodeLabel extends StatelessWidget with ViewRouter {
//   const ScannedBarcodeLabel({
//     super.key,
//     required this.barcodes,
//   });

//   final Stream<BarcodeCapture> barcodes;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: barcodes,
//       builder: (context, snapshot) {
//         final scannedBarcodes = snapshot.data?.barcodes ?? [];

//         final values = scannedBarcodes.map((e) => e.displayValue).join(', ');
//         print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");

//         // goto('/nikita/restaurant/10');

//         if (scannedBarcodes.isEmpty) {
//           return const Text(
//             'Scan something!',
//             overflow: TextOverflow.fade,
//             style: TextStyle(color: Colors.white),
//           );
//         } else {

//         }

//         return Text(
//           values.isEmpty ? 'No display value.' : values,
//           overflow: TextOverflow.fade,
//           style: const TextStyle(color: Colors.white),
//         );
//       },
//     );
//   }
// }


class AnalyzeImageFromGalleryButton extends StatelessWidget {
  const AnalyzeImageFromGalleryButton({required this.controller, super.key});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: const Icon(Icons.image),
      iconSize: 32.0,
      onPressed: () async {
        // final ImagePicker picker = ImagePicker();

        // final XFile? image = await picker.pickImage(
        //   source: ImageSource.gallery,
        // );

        // if (image == null) {
        //   return;
        // }

        // final BarcodeCapture? barcodes = await controller.analyzeImage(
        //   image.path,
        // );

        // if (!context.mounted) {
        //   return;
        // }

        // final SnackBar snackbar = barcodes != null
        //     ? const SnackBar(
        //         content: Text('Barcode found!'),
        //         backgroundColor: Colors.green,
        //       )
        //     : const SnackBar(
        //         content: Text('No barcode found!'),
        //         backgroundColor: Colors.red,
        //       );

        // ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
    );
  }
}

class StartStopMobileScannerButton extends StatelessWidget {
  const StartStopMobileScannerButton({required this.controller, super.key});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return IconButton(
            color: Colors.white,
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              await controller.start();
            },
          );
        }

        return IconButton(
          color: Colors.white,
          icon: const Icon(Icons.stop),
          iconSize: 32.0,
          onPressed: () async {
            await controller.stop();
          },
        );
      },
    );
  }
}

class SwitchCameraButton extends StatelessWidget {
  const SwitchCameraButton({required this.controller, super.key});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return const SizedBox.shrink();
        }

        final int? availableCameras = state.availableCameras;

        if (availableCameras != null && availableCameras < 2) {
          return const SizedBox.shrink();
        }

        final Widget icon;

        switch (state.cameraDirection) {
          case CameraFacing.front:
            icon = const Icon(Icons.camera_front);
          case CameraFacing.back:
            icon = const Icon(Icons.camera_rear);
        }

        return IconButton(
          color: Colors.white,
          iconSize: 32.0,
          icon: icon,
          onPressed: () async {
            await controller.switchCamera();
          },
        );
      },
    );
  }
}

class ToggleFlashlightButton extends StatelessWidget {
  const ToggleFlashlightButton({required this.controller, super.key});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return const SizedBox.shrink();
        }

        switch (state.torchState) {
          case TorchState.auto:
            return IconButton(
              color: Colors.white,
              iconSize: 32.0,
              icon: const Icon(Icons.flash_auto),
              onPressed: () async {
                await controller.toggleTorch();
              },
            );
          case TorchState.off:
            return IconButton(
              color: Colors.white,
              iconSize: 32.0,
              icon: const Icon(Icons.flash_off),
              onPressed: () async {
                await controller.toggleTorch();
              },
            );
          case TorchState.on:
            return IconButton(
              color: Colors.white,
              iconSize: 32.0,
              icon: const Icon(Icons.flash_on),
              onPressed: () async {
                await controller.toggleTorch();
              },
            );
          case TorchState.unavailable:
            return const SizedBox.square(
              dimension: 48.0,
              child: Icon(
                Icons.no_flash,
                size: 32.0,
                color: Colors.grey,
              ),
            );
        }
      },
    );
  }
}

class PauseMobileScannerButton extends StatelessWidget {
  const PauseMobileScannerButton({required this.controller, super.key});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return const SizedBox.shrink();
        }

        return IconButton(
          color: Colors.white,
          iconSize: 32.0,
          icon: const Icon(Icons.pause),
          onPressed: () async {
            await controller.pause();
          },
        );
      },
    );
  }
}


class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({super.key, required this.error});

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
      case MobileScannerErrorCode.unsupported:
        errorMessage = 'Scanning is unsupported on this device';
      default:
        errorMessage = 'Generic Error';
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:mobile_scanner/mobile_scanner.dart';

// import '../../helper/router.dart';

// class Scanner extends StatefulWidget {
//   const Scanner({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ScannerState();
// }

// class _ScannerState extends State<Scanner> with ViewRouter, WidgetsBindingObserver {

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     // If the controller is not ready, do not try to start or stop it.
//     // Permission dialogs can trigger lifecycle changes before the controller is ready.
//     if (!controller.value.hasCameraPermission) {
//       return;
//     }

//     switch (state) {
//       case AppLifecycleState.detached:
//       case AppLifecycleState.hidden:
//       case AppLifecycleState.paused:
//         return;
//       case AppLifecycleState.resumed:
//         // Restart the scanner when the app is resumed.
//         // Don't forget to resume listening to the barcode events.
//         _subscription = controller.barcodes.listen(_handleBarcode);

//         unawaited(controller.start());
//       case AppLifecycleState.inactive:
//         // Stop the scanner when the app is paused.
//         // Also stop the barcode events subscription.
//         unawaited(_subscription?.cancel());
//         _subscription = null;
//         unawaited(controller.stop());
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Start listening to lifecycle changes.
//     WidgetsBinding.instance.addObserver(this);

//     // Start listening to the barcode events.
//     _subscription = controller.barcodes.listen(_handleBarcode);

//     // Finally, start the scanner itself.
//     unawaited(controller.start());
//   }

//   @override
//   Future<void> dispose() async {
//     // Stop listening to lifecycle changes.
//     WidgetsBinding.instance.removeObserver(this);
//     // Stop listening to the barcode events.
//     unawaited(_subscription?.cancel());
//     _subscription = null;
//     // Dispose the widget itself.
//     super.dispose();
//     // Finally, dispose of the controller.
//     await controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(){

//     }
//   }

// }
















// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

// import '../../../viewmodel/restaurant/restaurant.id.dart';
// import '../../../viewmodel/scanner/scanner.controller.dart';
// import '../../helper/router.dart';
// import '../miscellaneous/global.dialog.dart';
// import 'restaurant.dart';

// class Scanner extends ConsumerStatefulWidget {
//   const Scanner({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ScannerState();
// }

// class _ScannerState extends ConsumerState<Scanner> with ViewRouter, GlobalDialog {

//   // Barcode? result;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   // Barcode barCode 

//  @override
// void dispose() {
//   _disposeController();

//   super.dispose();
// }

// @override
// Future<void> reassemble() async {
//   super.reassemble();

//   await ref.read(scannerControllerNotifierProvider)!.pauseCamera();
//   await ref.read(scannerControllerNotifierProvider)!.stopCamera();
//   print(ref.read(scannerControllerNotifierProvider)!.disposed);
  
// }

// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
  
// }


// Future<void> _disposeController() async {

//   await ref.read(scannerControllerNotifierProvider)!.pauseCamera();
//   await ref.read(scannerControllerNotifierProvider)!.stopCamera();
//   ref.read(scannerControllerNotifierProvider)!.dispose();
// //   if (controller != null) {
// //     await controller!.pauseCamera();
// //     await controller!.stopCamera();
// //     log(controller!.disposed.toString());
// //     controller!.dispose();
// //   }
// }


//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   // @override
//   // void reassemble() {
//   //   super.reassemble();
//   //   if (Platform.isAndroid) {
//   //     controller!.pauseCamera();
//   //   }
//   //   controller!.resumeCamera();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(flex: 4, child: _buildQrView(context)),
//         ],
//       ),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 250.0
//         : 400.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: (p0) {
//         ref.read(scannerControllerNotifierProvider.notifier).setController = p0;
//         ref.read(scannerControllerNotifierProvider)!.scannedDataStream.listen((scanData) async {
//           if(scanData.code.runtimeType == String && scanData.code!.isNotEmpty){
//             // log(controller.disposed.toString());
//             if(scanData.code == null || scanData.code!.isEmpty || scanData.code!.contains("/")){
//               showAlertDialog(
//                 success: false,
//                 message: "Invalid data",
//                 buttonText: "Continue"
//               );
//             }else {
//               // await ref.read(scannerControllerNotifierProvider.notifier).stopCamera(scanData.code!);
              
//               await ref.read(scannerControllerNotifierProvider)!.pauseCamera();
//               await ref.read(scannerControllerNotifierProvider)!.stopCamera();
//               ref.read(scannerControllerNotifierProvider)!.dispose();
//               ref.read(restaurantIdNotifierProvider.notifier).setIndex = int.parse(scanData.code!);
//               // goto('/nikita/restaurant/${scanData.code}');
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => Restaurant(tableId: int.parse(scanData.code!))));
//             }
//             // goto('/nikita/restaurant/10');
//           }
//         });    
//       },
//       overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated() {
//     ref.read(scannerControllerNotifierProvider)!.scannedDataStream.listen((scanData) async {
//       if(scanData.code.runtimeType == String && scanData.code!.isNotEmpty){
//         // log(controller.disposed.toString());
//         if(scanData.code == null || scanData.code!.isEmpty || scanData.code!.contains("/")){
//           showAlertDialog(
//             success: false,
//             message: "Invalid data",
//             buttonText: "Continue"
//           );
//         }else {
//           // await ref.read(scannerControllerNotifierProvider.notifier).stopCamera();
//           ref.read(restaurantIdNotifierProvider.notifier).setIndex = int.parse(scanData.code!);
//           goto('/nikita/restaurant/${scanData.code}');
//         }
//         // goto('/nikita/restaurant/10');
//       }
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }


// }
