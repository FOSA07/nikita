import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../model/user/profile.dart';
import '../../../utils/service.locator.dart';
import '../../repository/user.storage.dart';

class UserStorageController {
  final SecureStorageService _secureStorageService;

  static UserStorageController? _userStorageController;

  UserStorageController._() : _secureStorageService = locator<SecureStorageService>();

  factory UserStorageController() => _userStorageController ??= UserStorageController._();

  Future<Either<Failure, String>> storeToken(String token) {
    return _secureStorageService.storeToken(token);
  }

  Future<Either<Failure, String?>> getToken() async {
    return await _secureStorageService.getToken();
  }

  Future<Either<Failure, bool>> hasToken() async {
    return await _secureStorageService.hasToken();
  }

  Future<Either<Failure, bool>> deleteToken() async {
    return await _secureStorageService.deleteToken();
  }

  Future<Either<Failure, UserProfileModel>> getUser() async {
    return await _secureStorageService.getUser();
  }

  Future<Either<Failure, UserProfileModel>> storeUser(UserProfileModel user) async {
    return await _secureStorageService.storeUser(user);
  }

  Future<Either<Failure, String?>> getView() async {
    return await _secureStorageService.getView();
  }

  Future<Either<Failure, String?>> changeView() async {
    return await _secureStorageService.setView();
  }
}
