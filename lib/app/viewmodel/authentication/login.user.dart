import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/controller/authentication/login.dart';
import '../../model/authentication/login.dart';
import '../../view/helper/router.dart';
import '../../view/screen/miscellaneous/global.dialog.dart';
import '../form/login.user.form.dart';
import '../user/user.dart';

part 'login.user.g.dart';

@Riverpod(keepAlive: true)
class LoginUserAccountNotifier extends _$LoginUserAccountNotifier
    with ViewRouter, GlobalDialog {
  Future loginUser() async {
    try {
      state = const AsyncLoading();
      UserLoginModel userModel = ref.read(loginUserFormNotifierProvider);
      final response = await LoginUserController().login(userModel: userModel);
      
      response.fold(
        (failure) {
          state = AsyncValue.data(failure);
          showAlertDialog(
            message: failure.message,
          );
        },
        (result) async { 
          // await ref.read(userProfileNotifierProvider.notifier).fetchUserProfile();
          // await ref.read(accountModeNotifierProvider.notifier).getAccountMode();
          ref.read(userNotifierProvider.notifier).setUserNotifier = result;
          state = AsyncValue.data(result);
          print(result.user.toString());

          // goto('/nikita/restaurant/10');
          // goto('/nikita/chat');
          goto('/nikita/nikita');
          
          // showAlertDialog(
          //   message: 'Login Successfull',
          //   success: true,
          //   buttonText: 'Proceed',
          //   onClose: () => goto('/features'),
          // );
          
        }
      );
    } catch (e) {
      log('e = $e');

      state = AsyncValue.error(e, StackTrace.current);

      // showAlertDialog(
      //   message: 'an error occured',
      // );
    }
  }

  @override
  FutureOr build() async {
    return state;
  }
}
