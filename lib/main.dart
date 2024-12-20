import 'package:flutter/material.dart';
import 'package:flutter_test_app/routes.dart';
import 'package:flutter_test_app/themes/main/theme.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      title: 'Flutter Demo',
      theme: MainTheme.lightTheme,
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: MainTheme.lightTheme,
    //   home: const HomeScreen(),
    // );
  }
}
