import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/routes/routes.dart';
import 'package:flutter_test_app/screens/splash_screen.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:flutter_test_app/themes/main/theme.dart';

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

  LoadingState _loadedState = LoadingState.none;
  LoadedStore? _loadedStore;

  // Store<AppState>? _store;

  @override
  Widget build(BuildContext context) {
    if (_loadedState == LoadingState.none) {
      setState(() {
        _loadedState = LoadingState.loading;
      });

      _MyAppViewModel().loadStore().then((store) {
        setState(() {
          _loadedState = LoadingState.loaded;
          _loadedStore = store;
          // _store = store;
        });
      });
    }

    if (_loadedState != LoadingState.loaded) {
      return MaterialApp(
        theme: MainTheme.dartTheme,
        home: SplashScreen(),
      );
    }

    return MaterialApp.router(
      theme: MainTheme.dartTheme,
      routerConfig: routes,
    );
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
