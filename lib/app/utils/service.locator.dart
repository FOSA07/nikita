import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../data/repository/user.storage.dart';
import '../data/service/authentication/authentication.dart';
import '../data/service/authentication/imp/create.account.dart';
import '../data/service/authentication/imp/login.dart';
import '../data/service/menuCategory/imp/menu.category.imp.dart';
import '../data/service/menuCategory/menu.category.dart';
import '../route/routes.dart';

final locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton<GoRouter>(() => routes);

  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService()
  );
  locator.registerLazySingleton<Authentication>(
    () => CreateUserAccountService(),
    instanceName: "CreateUserAccount"
  );
  locator.registerLazySingleton<Authentication>(
    () => LoginService(),
    instanceName: "LoginService"
  );
  // locator.registerLazySingleton<Authentication>(
  //   () => OTPService(),
  //   instanceName: "SendOTP"
  // );
  // locator.registerLazySingleton<Authentication>(
  //   () => ForgetPasswordService(),
  //   instanceName: "ForgetPasswordService"
  // );
  // locator.registerLazySingleton<Authentication>(
  //   () => CreatePasswordService(),
  //   instanceName: "CreatePasswordService"
  // );
  locator.registerLazySingleton<MenuCategory>(
    () => MenuCategoryService(),
    instanceName: "MenuCategoryService"
  );
}