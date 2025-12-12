import 'package:dartz/dartz.dart';

import 'package:dio/src/response.dart';

import 'package:nikita/app/core/exception/exception.dart';
import 'package:nikita/app/network/dio/dio.client.dart';

import '../menu.category.dart';

class MenuCategoryService extends MenuCategory {
  
  @override
  Future<Either<Failure, Response>> getMenuCategories() async{
    
    var response =
        await DioClient().get('/menu/categories');

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
  Future<Either<Failure, Response>> getDishes({required String category}) async{

    var response =
        await DioClient().get('/menu/categories/$category');

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