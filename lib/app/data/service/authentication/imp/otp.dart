
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exception/exception.dart';
import '../../../../network/dio/dio.client.dart';
import '../authentication.dart';

class OTPService extends Authentication {
  @override
  Future<Either<Failure, Response>> sendOTP({
    required String tkn,
    
  }) async {
    var response = await DioClient().post(
      '/auth/account/verify/resend?tkn=$tkn',
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

  @override
  Future<Either<Failure, Response>> verifyOTP({
    required String tkn,
    required String uid,
    required String code,
    required bool isPasswordRecoveryCerification,
  }) async {
    Either<Failure, Response<dynamic>>? response;

    if (isPasswordRecoveryCerification) {
      response = await DioClient().post(
        '/auth/password/verify?tkn=$tkn',
        data: {"userid": uid, "code": code},
      );
    } else {
      response = await DioClient().post(
        '/auth/account/verify?tkn=$tkn',
        data: {"userid": uid, "code": code},
      );
    }

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
