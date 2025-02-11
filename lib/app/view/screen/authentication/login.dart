import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/authentication/login.user.dart';
import '../../../viewmodel/form/login.user.form.dart';
import '../../widget/action.button.dart';
import '../../widget/background.dart';
import '../../widget/text.form.field.dart';
import '../../helper/router.dart';
import 'helper/validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with ViewRouter, Validators {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Hello Again!',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 6,),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, urna, a, fusce',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Color(0xFF636B75)
                                ),
                              )
                            ],
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              return Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    AppTextFormField(
                                      controller: _email,
                                      hintText: 'Your E-mail Address',
                                      validator: validateEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (p0) => ref.read(loginUserFormNotifierProvider.notifier).updateEmail(p0),
                                    ),
                                    const SizedBox(height: 10,),
                                    // AppTextFormField(
                                    //   controller: _password,
                                    //   hintText: 'Your Password',
                                    //   validator: validatePassword,
                                    // ),
                                    ValueListenableBuilder(
                                      valueListenable: _obscureText,
                                      builder: (context, value, child) =>
                                          AppTextFormField(
                                            controller: _password,
                                            hintText: 'Password',
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: _obscureText.value,
                                            suffixIcon: InkWell(
                                                onTap: () => _obscureText.value =
                                                    !_obscureText.value,
                                                child: Icon(
                                                  _obscureText.value
                                                      ? Icons.remove_red_eye
                                                      : Icons.visibility_off,
                                                  color: _obscureText.value
                                                      ? Colors.grey
                                                      : Color(0xFFA44B6F)
                                                )),
                                            validator: validatePassword,
                                            onChanged: (p0) =>
                                                ref.read(loginUserFormNotifierProvider.notifier).updatePassword(p0),
                                          )),
                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RichText(text: TextSpan(
                                          text: 'Forgot Password?',
                                          style: TextStyle(
                                            color: Color(0xFFA44B6F),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap =
                                                () => goto(''),
                                        )),
                                      ],
                                    )
                                  ],
                                )
                              );
                            }
                          ),
                          const SizedBox(height: 5,),
                          Consumer(
                            builder: (context, ref, child) {
                              return AppActionButton(
                                text: 'Login', 
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    ref
                                      .read(loginUserAccountNotifierProvider.notifier)
                                      .loginUser();
                                  }
                                }, 
                                isLoading: ref.watch(loginUserAccountNotifierProvider).isLoading,
                              );
                            }
                          ),
                          Column(
                            spacing: 15,
                            children: [
                              Text(
                                'Or Login With',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Color(0xFF636B75),
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                spacing: 10,
                                children: List.generate(3, (index) => Expanded(
                                  child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.08),
                                          blurRadius: 14, 
                                          offset: Offset(0, 8), 
                                          spreadRadius: 0, 
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        index == 0 ? AppImages.facebook :
                                          index == 1 ? AppImages.google :
                                            AppImages.apple
                                      )
                                    ),
                                  ),
                                ),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ),
            
                RichText(
                  text: TextSpan(
                      text: "Don't have an account now? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Register now',
                          style: TextStyle(
                            color: Color(0xFFA44B6F),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => goto('/auth/signup'),
                        )
                      ]),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}