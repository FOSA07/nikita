import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/user/profile.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {

  UserProfileModel? user;

  @override
  UserProfileModel? build () {
    user;
  }

  set setUserNotifier (UserProfileModel user) {
    this.user = user;
  }

  get getUser => user;
}