import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/authentication/login.dart';
import '../../../model/user/profile.dart';
import '../../../utils/service.locator.dart';
import '../../service/authentication/authentication.dart';

class LoginUserController {
  static LoginUserController? _instance;

  LoginUserController._();

  factory LoginUserController() => _instance ??= LoginUserController._();

  Future<Either<Failure, UserProfileModel>> login(
      {required UserLoginModel userModel}) async {
    final loginService = locator<Authentication>(instanceName: "LoginService");

    final response = await loginService.loginUser(userModel: userModel);

    return response.fold(
      (failure) => Left(failure),
      (success) {
        // log('success.data["kdata"] = ${success.data["data"]}');
        try{
          Map<String, dynamic> res = success.data["data"];
          log(res.toString());
          return Right(UserProfileModel.fromJson(res));
        } catch(e, stackTrace){
          log(e.toString(), stackTrace: stackTrace);
          return Left(Failure("Error"));
        }
        
      },
    );
  }
}
