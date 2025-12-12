import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../view/helper/router.dart';

part 'scanner.controller.g.dart';

@Riverpod(keepAlive: true)
class ScannerControllerNotifier extends _$ScannerControllerNotifier with ViewRouter {

  QRViewController? controller;

  @override
  QRViewController? build(){
    return controller; 
  }

  set setController(QRViewController controller) {
    state = controller;
  }

  Future stopCamera (String code) async {
    await controller!.pauseCamera();
    await controller!.stopCamera();
    controller!.dispose();
    // ref.read(restaurantIdNotifierProvider.notifier).setIndex = int.parse(code);
    // goto('/nikita/restaurant/$code');
  }

}