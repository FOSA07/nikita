import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom.nav.control.g.dart';

@Riverpod(keepAlive: true)
class BottomNavIndexNotifier extends _$BottomNavIndexNotifier {

  @override
  int build(){
    return 0; 
  }

  set setIndex(int index) {
    state = index;
  }

}