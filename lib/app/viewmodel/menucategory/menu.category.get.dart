import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/controller/menu.categories/menu.categories.dart';

part 'menu.category.get.g.dart';

@Riverpod(keepAlive: true)
class GetMenuCategories extends _$GetMenuCategories {

  List _categories = [];
  Future getCategoriesList () async {

    state = const AsyncLoading();
    final response = await MenuCategoriesController().getMenuCategories();

    response.fold(
      (failure) {
        state = AsyncValue.error(Left(failure), StackTrace.current);
      }, 
      (success) {
        state = AsyncValue.data(AsyncValue.data(Right(success)));
        _categories = success;
      }
    );
  }

  @override
  FutureOr build () {
    return Future(() => const AsyncValue.data(''),);
  }

  set setCategories(List categories) {
    _categories = categories;
  }

  List get getCategories => _categories;

  resetFaculties () {
    _categories = [];
  }
}