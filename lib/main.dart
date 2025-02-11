import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app/utils/constant/text.theme.dart';
import 'app/utils/service.locator.dart';

void main() {
  
  setUpLocator();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = locator<GoRouter>();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0x80A44B6F),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    
    return MaterialApp.router(
      routerConfig: _routes,
      debugShowCheckedModeBanner: false,
      title: 'Nikita',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'PR',
        textTheme: appTextTheme
      ),
    );
  }
}