import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/authentication/create.user.dart';
import '../../../viewmodel/form/create.user.form.dart';
import '../../widget/action.button.dart';
import '../../widget/background.dart';
import '../../widget/text.form.field.dart';
import 'helper/validators.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> with Validators {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final ValueNotifier<bool> terms = ValueNotifier(false);

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _surname.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountForm = ref.read(createUserFormNotifierProvider.notifier);

    final ValueNotifier<bool> privacy = ValueNotifier(false);

    return Scaffold(
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: EdgeInsets.all(28),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 25,
                      children: [
                        const SizedBox(height: 1,),
                        Text(
                          'Register Now!',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet, urna, a, fusce',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xFF636B75)
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: AppTextFormField(
                                      controller: _name,
                                      hintText: 'Name',
                                      keyboardType: TextInputType.name,
                                      validator: validateName,
                                      onChanged: (p0) => accountForm.updateName(p0),
                                    ),
                                  ),
                                  Expanded(
                                    child: AppTextFormField(
                                      controller: _surname,
                                      hintText: 'Surname',
                                      keyboardType: TextInputType.name,
                                      validator: validateName,
                                      onChanged: (p0) => accountForm.updateSurame(p0),
                                    ),
                                  )
                                ],
                              ),
                              AppTextFormField(
                                controller: _email,
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                                onChanged: (p0) => accountForm.updateEmail(p0),
                              ),
                              AppTextFormField(
                                controller: _password,
                                hintText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                validator: validatePassword,
                                onChanged: (p0) => accountForm.updatePassword(p0),
                              ),
                              AppTextFormField(
                                controller: _confirmPassword,
                                hintText: 'Repeat Password',
                                keyboardType: TextInputType.visiblePassword,
                                validator: (p0) => _confirmPassword
                                          .text.isEmpty
                                      ? 'Please enter a password'
                                      : _password.text == _confirmPassword.text
                                          ? null
                                          : 'Password doesn\'t match',
                                onChanged: (p0) => accountForm.updateConfirmPassword(p0),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: terms,
                                builder: (context, value, child) {
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      border: Border.all(
                                        color: terms.value == false? Colors.transparent : Color(0xFFA44B6F),
                                        width: 2
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        Text('Terms/condition'),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                              value: terms.value,
                                              onChanged: (value) {
                                                terms.value = !terms.value;
                                                accountForm.updateTerms(terms.value);
                                              },
                                              activeColor: Color(0xFFA44B6F),
                    
                                            ),
                                            Text('Check')
                                          ],
                                        ),
                                        
                                      ],
                                    ),
                                  );
                                }
                              ),
                            ),
                            Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: privacy,
                                builder: (context, value, child) {
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      border: Border.all(
                                        color: privacy.value == false? Colors.transparent : Color(0xFFA44B6F),
                                        width: 2
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        Text('Privacy Policy'),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: privacy.value,
                                              onChanged: (value) {
                                                privacy.value = !privacy.value;
                                              },
                                              activeColor: Color(0xFFA44B6F),
                                            ),
                                            Text('Check')
                                          ],
                                        ),
                                        
                                      ],
                                    ),
                                  );
                                }
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ),
                AppActionButton(
                  text: 'Register now',
                  onPressed: (){
                    if(_formKey.currentState!.validate() && terms.value == true){
                      ref
                        .read(createUserAccountNotifierProvider.notifier)
                        .createUser();
                    } else if (_formKey.currentState!.validate() && terms.value != true){
                          ScaffoldMessenger.
                            of(context).
                            showSnackBar(
                              const SnackBar(
                                content: Text("Please Check Terms/Condition"),
                                // action: SnackBarAction(label: "reload", onPressed: () => action),

                              )
                            );
                    }
                  },
                  isLoading: ref.watch(createUserAccountNotifierProvider).isLoading,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}