import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_test_app/screens/login_screen/login_screen.dart';

final List<RouteBase> signInRoutes = [
  ShellRoute(
    builder: (context, state, child) {
      return Scaffold(
        body: child,
      );
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  ),
];
