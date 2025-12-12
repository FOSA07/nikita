import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/service.locator.dart';

mixin GlobalDialog {
  final _routes = locator<GoRouter>();

  void showAlertDialog({
    String message = "Oops! an error occured",
    bool success = false,
    Function()? onClose,
    String? buttonText,
  }) {
    showDialog(
      context: _routes.routerDelegate.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: IntrinsicHeight(
            child: IntrinsicWidth(
              child: Container(
                decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 140, 199, 248),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ).copyWith(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.notifications,
                        //   color: success ? Colors.green : Colors.red,
                        // ),
                        Icon(
                          success
                              ? CupertinoIcons.check_mark_circled_solid
                              : Icons.info,
                          color: success ? Colors.green : Colors.amber,
                          size: 50,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          success ? 'Successfull' : 'Error',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          message.replaceRange(0, 1, message[0].toUpperCase()),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Divider(
                    //   color: Colors.blue,
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        // mainAxisAlignment: MainAxis,
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFA44B6F)
                              ),
                              onPressed: onClose ?? context.pop,
                              child: Text(
                                buttonText ?? 'Cancel',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
