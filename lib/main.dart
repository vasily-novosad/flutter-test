import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/providers/auth_provider.dart';
import 'package:flutter_test_app/providers/counter_provider.dart';
// import 'package:flutter_test_app/redux/states/auth_state.dart';
// import 'package:flutter_test_app/redux/store.dart';
import 'package:flutter_test_app/routes/routes.dart';
import 'package:flutter_test_app/screens/home_screen/order_info.dart';
import 'package:flutter_test_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
// import 'package:flutter_test_app/redux/states/app_state.dart';
// import 'package:flutter_test_app/screens/splash_screen/splash_screen.dart';
// import 'package:flutter_test_app/services/storage.dart';
import 'package:flutter_test_app/themes/main/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:redux/redux.dart';



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

    GoRouter routes = createRoutes();

    if (_loadedState != LoadingState.loaded) {
      return MaterialApp(theme: MainTheme.lightTheme, home: SplashScreen());
    }

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterProvider>(
              create: (_) => CounterProvider()),
          ChangeNotifierProvider<OrderInfoViewModel>(
              create: (_) => OrderInfoViewModel()),
          ChangeNotifierProvider<AuthProvider>(
              create: (_) => AuthProvider(token: _loadedStore?.token)),
        ],
        child: MaterialApp.router(
          theme: MainTheme.lightTheme,
          routerConfig: routes,
        ));
    // }

    // return CupertinoApp(theme: MainTheme.lightTheme, home: SplashScreen());
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
    // StorageAction storage = await Storage().getStorage();

    // String? token = storage.getItem('@token');
    // Store<AppState> store = createStore(AppState(
    //     authState:
    //         AuthentificationState(accessToken: AccessToken(token: token))));

    // var v = _RouterProvider();

    // return store;
  }
}

// typedef FunctionBuilderCallback = List<GoRoute> Function();
