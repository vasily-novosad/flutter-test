import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/home_info_screen/home_info_screen.dart';
import 'package:flutter_test_app/screens/home_screen/home_screen.dart';
import 'package:flutter_test_app/screens/second_screen/second_screen.dart';
import 'package:flutter_test_app/screens/root_screen/root_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

// GoRouter configuration
final routerConfig = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return Root(child: child);
          },
          routes: [
            GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                      path: 'info',
                      builder: (context, state) => const HomeInfoScreen())
                ]),
            GoRoute(
                path: '/second',
                builder: (context, state) => const SecondScreen()),
          ])
    ]);
