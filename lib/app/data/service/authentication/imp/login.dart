import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../model/authentication/login.dart';
import '../../../../network/dio/dio.client.dart';
import '../authentication.dart';

class LoginService extends Authentication {
  @override
  Future<Either<Failure, Response>> loginUser({
    required UserLoginModel userModel,
  }) async {
    var response =
        await DioClient().post(
          // '/login', 
          "/auth/login",
          data: userModel.toJson());

    return response.fold((failure) {
      return Left(failure);
    }, (result) {
      
      try {
        return Right(result);
      } catch (e) {
        return Left(Failure("An error occured", exception: e));
      }
    });
  }
}
