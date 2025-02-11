import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../utils/service.locator.dart';
import '../../service/authentication/authentication.dart';

class CreatePasswordController {
  static CreatePasswordController? _createPasswordController;

  CreatePasswordController._();

  factory CreatePasswordController () => 
    _createPasswordController ??= CreatePasswordController._();

  Future<Either<Failure, Map>> createNewPassword ({
    required String hash,
    required String uid,
    required String password
  }) async{
    
    final createPasswordService = locator<Authentication>(
      instanceName: "CreatePasswordService"
    );

    final result = await createPasswordService.createPassword(
      hash: hash,
      uid: uid,
      password: password
    );

    return result.fold(
      (failure) => Left(failure),
      (success) { 
        return Right(success.data);},
    );
  }
}