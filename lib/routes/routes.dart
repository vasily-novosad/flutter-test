import 'package:flutter/material.dart';
import 'package:flutter_test_app/routes/profile_routes.dart';
import 'package:flutter_test_app/routes/signin_routes.dart';
import 'package:flutter_test_app/screens/redux_test_screen/redux_test_screen.dart';

// import 'package:flutter_test_app/services/app_loader.dart';
// import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:go_router/go_router.dart';

GoRouter createRoutes() {
  final GoRouter routes = GoRouter(
      initialLocation: '/profile',
      routes: [
        ...profileRoutes,
        ...signInRoutes,
        GoRoute(
          path: '/redux',
          builder: (context, state) => const ReduxTestScreen(),
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) async {
//         bool hasToken =
//             AccessToken.isEmptyToken(store.state.authState.accessToken.token) ==
//                 false;
// // print('check');

//         if (hasToken && state.fullPath == '/login') {
//           return '/profile';
//         }

//         if (!hasToken && state.fullPath != '/login') {
//           return '/login';
//         }

        return null;
      });

  return routes;
}
