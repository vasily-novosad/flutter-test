import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/app/app_store.dart';
import 'package:flutter_test_app/routes/routes.dart';
import 'package:flutter_test_app/themes/main/theme.dart';
import 'package:go_router/go_router.dart';

GoRouter routes = createRoutes();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  _MyApp();

  @override
  Widget build(BuildContext context) {

    return StoreProvider<AppState>(
        store: appStore,
        child: MaterialApp.router(
          theme: MainTheme.lightTheme,
          routerConfig: routes,
        ));
  }
}
