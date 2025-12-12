import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/exception/exception.dart';
import '../../model/user/profile.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_key';
  static const String _userId = 'user_id';
  static const String _appOnbording = 'app_onboarding';

  Future<Either<Failure, String>> storeToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
      return Right(token);
    } catch (e) {
      return Left(Failure('An error occurred while storing the token.', exception: e));
    }
  }

  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      return Right(token);
    } catch (e) {
      return Left(Failure('An error occurred while retrieving the token.', exception: e));
    }
  }

  Future<Either<Failure, bool>> hasToken() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      return Right(token != null);
    } catch (e) {
      return Left(Failure('An error occurred while checking for the token.', exception: e));
    }
  }

  Future<Either<Failure, bool>> deleteToken() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
      return const Right(true);
    } catch (e) {
      return Left(Failure('An error occurred while deleting the token.', exception: e));
    }
  }

  Future<Either<Failure, String>> storeId(String id) async {
    try {
      await _secureStorage.write(key: _userId, value: id);
      return Right(id);
    } catch (e) {
      return Left(Failure('An error occurred while storing the token.', exception: e));
    }
  }

  Future<Either<Failure, String?>> getId() async {
    try {
      final id = await _secureStorage.read(key: _userId);
      return Right(id);
    } catch (e) {
      return Left(Failure('An error occurred while retrieving the token.', exception: e));
    }
  }

  Future<Either<Failure, bool>> hasId() async {
    try {
      final id = await _secureStorage.read(key: _userId);
      return Right(id != null);
    } catch (e) {
      return Left(Failure('An error occurred while checking for the token.', exception: e));
    }
  }

  Future<Either<Failure, bool>> deleteId() async {
    try {
      await _secureStorage.delete(key: _userId);
      return const Right(true);
    } catch (e) {
      return Left(Failure('An error occurred while deleting the token.', exception: e));
    }
  }

  Future<Either<Failure, UserLoggedInModel>> storeUser(UserLoggedInModel user) async {
    try {
      await _secureStorage.write(key: _userKey, value: user.toString());
      return Right(user);
    } catch (e) {
      return Left(Failure('An error occurred while storing the token.', exception: e));
    }
  }

  Future<Either<Failure, UserLoggedInModel>> getUser() async {
    try {
      final String? user = await _secureStorage.read(key: _userKey);

      return user != null ? Right(UserLoggedInModel.fromJson(user)) : Left(Failure("No user found in repository"));
    } catch (e) {
      return Left(Failure('An error occurred while retrieving the token.', exception: e));
    }
  }

  Future<Either<Failure, String>> setView() async {
    try {
      await _secureStorage.write(key: _appOnbording, value: 'Empty');
      return Right('Empty');
    } catch (e) {
      return Left(Failure('An error occurred while storing the token.', exception: e));
    }
  }

  Future<Either<Failure, String?>> getView() async {
    try {
      final String? value = await _secureStorage.read(key: _appOnbording);

      return Right(value);
    } catch (e) {
      return Left(Failure('An error occurred while retrieving the token.', exception: e));
    }
  }
}
