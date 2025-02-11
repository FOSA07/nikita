import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/authentication/create.user.dart';
import '../../../utils/service.locator.dart';
import '../../service/authentication/authentication.dart';

class CreateUserController {

  static CreateUserController? _instance;

  CreateUserController._();

  factory CreateUserController() => _instance ??= CreateUserController._();

  Future<Either<Failure, Map>> createUser ({required CreateUserModel userModel}) async {

    final createService = locator<Authentication>(instanceName: "CreateUserAccount");

    final response = await createService.createUser(userModel: userModel);

    return response.fold(
      (failure) => Left(failure),
      (success) {
        try{
          return Right(success.data as Map);
        } catch (e, stackTrace){
          log(e.toString(), stackTrace: stackTrace);
          return Left(Failure("Internal Server Error"));
        }
        
      },
    );
  }
}