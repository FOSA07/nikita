import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant.id.g.dart';

@Riverpod(keepAlive: true)
class RestaurantIdNotifier extends _$RestaurantIdNotifier {

  @override
  int build(){
    return 10; 
  }

  set setIndex(int index) {
    state = index;
  }
}
