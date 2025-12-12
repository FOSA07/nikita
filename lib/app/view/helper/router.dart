import 'package:go_router/go_router.dart';

import '../../utils/service.locator.dart';

mixin ViewRouter {
  
  goto(
    String path,
    { bool canBack = true,
      Object? extra
    }
  ) {
    canBack 
    ?  locator<GoRouter>().routerDelegate.navigatorKey.currentContext!.push(path, extra: extra)
    : locator<GoRouter>().routerDelegate.navigatorKey.currentContext!.go(path, extra: extra);
  }

  back(){
    locator<GoRouter>().routerDelegate.navigatorKey.currentContext!.pop();
  }

}