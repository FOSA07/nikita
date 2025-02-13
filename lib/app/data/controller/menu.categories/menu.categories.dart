import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../utils/service.locator.dart';
import '../../service/menuCategory/menu.category.dart';

class MenuCategoriesController {
  static MenuCategoriesController? _instance;

  MenuCategoriesController._();

  factory MenuCategoriesController() => _instance ??= MenuCategoriesController._();

  final menuCategoryService = locator<MenuCategory>(instanceName: "MenuCategoryService");

  
  Future<Either<Failure, List>> getMenuCategories() async {

    final response = await menuCategoryService.getMenuCategories();

    return response.fold(
      (failure) => Left(failure),
      (success) {
        final List<dynamic> rawData = success.data["data"] as List<dynamic>;
        final List<Map<String, dynamic>> mapList = rawData
            .map((item) => Map<String, dynamic>.from(item))
            .toList();
        return Right(mapList);
      }
    );
  }

  Future<Either<Failure, dynamic>> getDishes(String category) async {

    final response = await menuCategoryService.getDishes(category: category);

    return response.fold(
      (failure) => Left(failure),
      (success) {
        
        return Right(success.data["data"]);
      }
    );
  }
  

}
