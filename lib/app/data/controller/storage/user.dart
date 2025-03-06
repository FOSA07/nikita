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

  Future<Either<Failure, String>> storeId(String id) {
    return _secureStorageService.storeId(id);
  }

  Future<Either<Failure, String?>> getId() async {
    return await _secureStorageService.getId();
  }

  Future<Either<Failure, bool>> hasId() async {
    return await _secureStorageService.hasId();
  }

  Future<Either<Failure, bool>> deleteId() async {
    return await _secureStorageService.deleteId();
  }

  Future<Either<Failure, UserLoggedInModel>> getUser() async {
    return await _secureStorageService.getUser();
  }

  Future<Either<Failure, UserLoggedInModel>> storeUser(UserLoggedInModel user) async {
    return await _secureStorageService.storeUser(user);
  }

  Future<Either<Failure, String?>> getView() async {
    return await _secureStorageService.getView();
  }

  Future<Either<Failure, String?>> changeView() async {
    return await _secureStorageService.setView();
  }
}
