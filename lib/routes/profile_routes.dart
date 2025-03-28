import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';

import 'package:flutter_test_app/screens/home_info_screen/home_info_screen.dart';
import 'package:flutter_test_app/screens/home_screen/home_screen.dart';
import 'package:flutter_test_app/screens/login_screen/login_screen.dart';
import 'package:flutter_test_app/screens/redux_test_screen/redux_test_screen.dart';
import 'package:flutter_test_app/screens/second_screen/second_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> profileRoutes = [
  ShellRoute(
    builder: (context, state, child) {
      return Scaffold(
        appBar: MyAppbar(Text('Profile')).of(context),
        body: child,
      );
    },
    routes: [
      GoRoute(
          path: '/profile',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
                path: 'info',
                builder: (context, state) => const HomeInfoScreen()),
            GoRoute(
                path: 'second',
                builder: (context, state) => const SecondScreen()),
            GoRoute(
                path: 'redux',
                builder: (context, state) => const ReduxTestScreen()),
            GoRoute(
                path: 'login',
                builder: (context, state) => const LoginScreen()),
          ]),
    ],
  )
];
