import 'package:dartz/dartz.dart';

import '../../../core/exception/exception.dart';
import '../../../utils/service.locator.dart';
import '../../service/menuCategory/menu.category.dart';

class MenuCategoriesController {
  static MenuCategoriesController? _instance;

  MenuCategoriesController._();

  factory MenuCategoriesController() => _instance ??= MenuCategoriesController._();

  final menuCategoryService = locator<MenuCategory>(instanceName: "MenuCategoryService");

  
  Future<Either<Failure, List<Map>>> getMenuCategories() async {

    final response = await menuCategoryService.getMenuCategories();

    return response.fold(
      (failure) => Left(failure),
      (success) {
        return Right(success.data["data"]);
      }
    );
  }
  

}
