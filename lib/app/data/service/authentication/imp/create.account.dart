import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../model/authentication/create.user.dart';
import '../../../../network/dio/dio.client.dart';
import '../authentication.dart';

class CreateUserAccountService extends Authentication {
  @override
  Future<Either<Failure, Response>> createUser(
      {required CreateUserModel userModel}) async {
    print("sign up house");
    print(userModel.toJson().toString());
    var response = await DioClient().post(
      // '/register',
      '/auth/signup',
      data: userModel.toJson(),
    );

    print(response);

    return response.fold((failure) {
      log("This failure");
      log(failure.toString());
      
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
