import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/user/profile.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {

  UserLoggedInModel? user;
  String name = "John";

  @override
  UserLoggedInModel? build () {
    user;
    return null;
  }

  set setUserNotifier (UserLoggedInModel user) {
    this.user = user;
  }

  get getUser => user;

  

}