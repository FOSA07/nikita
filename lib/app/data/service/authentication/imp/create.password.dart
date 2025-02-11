import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../network/dio/dio.client.dart';
import '../authentication.dart';

class CreatePasswordService extends Authentication {

  @override
  Future<Either<Failure, Response>> createPassword ({
    required String hash,
    required String uid,
    required String password,
  }) async {
    
    var response = await DioClient().post(
      '/auth/password/reset?hash=$hash',
      data: {"userid": uid, "newpassword": password, "confirmpassword": password}
    );

    return response.fold(
    (failure) => Left(failure),
    (result) {
      try {
        return Right(result);
      } catch (e) {
        return Left(Failure("An error occured", exception: e));
      }
    });
  }
}