import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/authentication/login.dart';

part 'login.user.form.g.dart';

@Riverpod(keepAlive: true)
class LoginUserFormNotifier extends _$LoginUserFormNotifier {

  @override
  UserLoginModel build () {
    return UserLoginModel(
      email: '', 
      password: ''
    );
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }
  
}