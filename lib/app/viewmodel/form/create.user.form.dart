import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../model/authentication/create.user.dart';

part 'create.user.form.g.dart';

@Riverpod(keepAlive: true)
class CreateUserFormNotifier extends _$CreateUserFormNotifier {

  @override
  CreateUserModel build() {
    return CreateUserModel(
      name: '', 
      surname: '', 
      email: '', 
      password: '', 
      confirmPassword: '', 
      termsAccepted: false
    );
  }

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateSurame(String value) {
    state = state.copyWith(surname: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void updateTerms(bool value) {
    state = state.copyWith(termsAccepted: value);
  }

  void resetForm() {
    state = CreateUserModel(
      name: '', 
      surname: '', 
      email: '', 
      password: '', 
      confirmPassword: '', 
      termsAccepted: false
    );
  }
}
