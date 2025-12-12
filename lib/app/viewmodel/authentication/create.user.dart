import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/controller/authentication/create.user.dart';
import '../../model/authentication/create.user.dart';
import '../../view/helper/router.dart';
import '../../view/screen/miscellaneous/global.dialog.dart';
import '../form/create.user.form.dart';

part 'create.user.g.dart';

@Riverpod(keepAlive: true)
class CreateUserAccountNotifier extends _$CreateUserAccountNotifier
    with ViewRouter, GlobalDialog {
  Future createUser() async {
    try {
      state = const AsyncLoading();
      CreateUserModel userModel = ref.read(createUserFormNotifierProvider);
      final response =
          await CreateUserController().createUser(userModel: userModel);
      state = AsyncValue.data(response);

      response.fold(
          (failure) => showAlertDialog(
            message: failure.message,
          ),
          // (failure) => print("failed"),
         (result) {
            showAlertDialog(
              success: true,
              message: "Account created successfully, Proceed to Login",
              buttonText: "continue",
              onClose: () {
                goto('/auth');
              },
            );
          // final uri = Uri.parse(result["data"]["verifyUrl"]);
          // String tk = uri.queryParameters['tkn']!;
          // goto('/auth/otp/$tk/${result["data"]["userid"]}/false');
        });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return Left(e.toString());
    }
  }

  @override
  FutureOr build() async {
    return state;
  }
}
