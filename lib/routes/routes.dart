import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:flutter_test_app/routes/profile_routes.dart';
import 'package:flutter_test_app/routes/signin_routes.dart';
// import 'package:flutter_test_app/services/app_loader.dart';
// import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

GoRouter createRoutes(Store<AppState> store) {
  final GoRouter routes = GoRouter(
      initialLocation: '/profile',
      routes: [...profileRoutes, ...signInRoutes],
      redirect: (BuildContext context, GoRouterState state) async {
        bool hasToken =
            AccessToken.isEmptyToken(store.state.authState.accessToken.token) ==
                false;
// print('check');

        if (hasToken && state.fullPath == '/login') {
          return '/profile';
        }

        if (!hasToken && state.fullPath != '/login') {
          return '/login';
        }

        return null;
      });

  return routes;
}
