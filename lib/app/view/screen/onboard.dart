import 'package:flutter/material.dart';

import '../../utils/constant/image.dart';
import '../widget/action.button.dart';
import '../widget/background.dart';
import '../helper/router.dart';

class Onboard extends StatelessWidget with ViewRouter {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.38,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AppImages.onboardLogo
                                    ),
                                    fit: BoxFit.cover, 
                                    // opacity: 0.8, // Adjust transparency (0.0 - fully transparent, 1.0 - fully visible)
                                  ),
                                ),
                              )  
                            ],
                        )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.39,
                          color: Color(0xFFA44B6F),
                        )
                      ],
                    ),

                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.28,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppImages.onboardCenter
                            ),
                            fit: BoxFit.cover, // Adjust as needed
                            // opacity: 0.8, // Adjust transparency (0.0 - fully transparent, 1.0 - fully visible)
                          ),
                        ),
                      ),
                      // child: Image.asset(
                      //   AppImages.onboardCenter,
                      //   height: MediaQuery.of(context).size.height * 0.32,
                      //   width: MediaQuery.of(context).size.width
                      // )
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.15,
                child: IntrinsicHeight(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      spacing: 17,
                      children: [
                        Image.asset(
                          AppImages.onboardHuman,
                          height: MediaQuery.of(context).size.width * 0.75,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xFFF2EBF0),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4), 
                                offset: Offset(0, 7),
                                blurRadius: 40,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 53,
                                  width: MediaQuery.of(context).size.width * 0.79,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: Color(0xFFA44B6F),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppActionButton(
                                      text: 'Sign up', 
                                      onPressed: (){
                                        goto('/auth/signup', canBack: false);
                                        // goto('/nikita/restaurant/10');
                                      },
                                      isLoading: false,
                                      textColor: Colors.black,
                                      buttonColor: Color(0xFFF2EBF0),
                                    )
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1.0, right: 1, bottom: 1),
                                      child: AppActionButton(
                                        text: 'Sign in',
                                        onPressed: (){
                                          goto('/auth', canBack: false);
                                          // goto('/nikita/nikita');
                                          // goto('/nikita/restaurant/4');
                                        },
                                        isLoading: false,
                                      ),
                                    )
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      )

    );
  }
}