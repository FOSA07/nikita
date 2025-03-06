import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/controller/menu.categories/menu.categories.dart';

part 'dishes.g.dart';

@Riverpod(keepAlive: true)
class GetDishesNotifier extends _$GetDishesNotifier{

  Future getDishes(String category) async{

    final result = await MenuCategoriesController().getDishes(category.toString());

    return result.fold(
      (failure) {
        // showSnackbar(action: () {
        //   ref.invalidate(getIndoorNotifierProvider);
        //   hideSnackbar();
        // },);
        return null;
      },
      (success) {
        return success["dishes"];
      });
  }

  @override
  Future build (var category) async{
    return await getDishes(category);
  }
}