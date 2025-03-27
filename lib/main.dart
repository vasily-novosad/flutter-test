import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/app/app_store.dart';
import 'package:flutter_test_app/routes/routes.dart';
import 'package:flutter_test_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
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

enum LoadingState {
  none,
  loading,
  loaded,
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

class LoadedStore {
  final String? token;

  LoadedStore({required this.token});
}

class _MyAppViewModel {
  Future<void> delay(int seconds) async {
    final completer = Completer<bool>();

    Timer(Duration(seconds: seconds), () {
      if (!completer.isCompleted) {
        completer.complete(false);
      }
    });

    await completer.future;
  }

  Future<LoadedStore> loadStore() async {
    StorageManager appStorage = StorageManager(mode: StorageManagerMode.app);
    StorageManagerRecord? authRecord = await appStorage.get('token');

    return LoadedStore(token: authRecord?.content);

  }
}

// typedef FunctionBuilderCallback = List<GoRoute> Function();
