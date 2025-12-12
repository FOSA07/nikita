// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../utils/serviceLocator/service.locator.dart';

// mixin GlobalSnackBar {

//   final _routes = locator<GoRouter>();

//   void showSnackbar ({
//     Function()? action
//   }){

//     ScaffoldMessenger.
//       of(_routes.routerDelegate.navigatorKey.currentContext!).
//       showSnackBar(
//         const SnackBar(
//           content: Text("failed to fetch data"),
//           // action: SnackBarAction(label: "reload", onPressed: () => action),

//         )
//       );
//   }

//   void hideSnackbar(){
//     ScaffoldMessenger.
//       of(_routes.routerDelegate.navigatorKey.currentContext!).
//       hideCurrentSnackBar();
//   }
// }