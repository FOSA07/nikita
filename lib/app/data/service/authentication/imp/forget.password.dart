
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../network/dio/dio.client.dart';
import '../authentication.dart';

class ForgetPasswordService extends Authentication {
  @override
  Future<Either<Failure, Response>> forgetPassword({
    required String email,
  }) async {
    var response = await DioClient().post(
      '/auth/password',
      data: {"email": email},
    );
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
