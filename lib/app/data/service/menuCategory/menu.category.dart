import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';

abstract class MenuCategory {

  Future<Either<Failure, Response>> getMenuCategories() =>
      throw UnimplementedError();
  Future<Either<Failure, Response>> getDishes({required String category}) =>
      throw UnimplementedError();
}