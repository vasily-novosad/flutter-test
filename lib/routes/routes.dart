import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/common_settings_screen.dart';
import 'package:flutter_test_app/screens/discharge_screen.dart';
import 'package:flutter_test_app/screens/help_screen.dart';
import 'package:flutter_test_app/screens/home_screen.dart';
import 'package:flutter_test_app/screens/menu_screen.dart';
import 'package:flutter_test_app/screens/transfer_screen.dart';
import 'package:flutter_test_app/screens/transfers_screen.dart';
import 'package:flutter_test_app/screens/user_settings_screen.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navigator_wrapper.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final GoRouter routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigatorWrapper(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  return HomeScreen();
                },
                routes: [
                  GoRoute(
                    path: 'transfer/:id', // will be -> /home/transfers
                    builder: (context, state) {
                      String id = state.pathParameters['id'] ?? '<no-id>';

                      return TransferScreen(transferID: id);
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/transfers',
              builder: (context, state) {
                return TransfersScreen();
              },
              routes: [
                GoRoute(
                  path: 'transfer/:id', // will be -> /home/transfers
                  builder: (context, state) {
                    String id = state.pathParameters['id'] ?? '<no-id>';

                    return TransferScreen(transferID: id);
                  },
                )
              ],
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/help',
              builder: (context, state) {
                return HelpScreen();
              },
              // routes: [
              //   GoRoute(
              //       path: 'details/:param',
              //       builder: (context, state) {
              //         return DetailsScreen(
              //             label: 'Details of B',
              //             param: state.pathParameters['param']);
              //       }),
              // ],
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/discharge',
              builder: (context, state) {
                return DischargeScreen();
              },
              // routes: [
              //   GoRoute(
              //       path: 'details/:param',
              //       builder: (context, state) {
              //         return DetailsScreen(
              //             label: 'Details of B',
              //             param: state.pathParameters['param']);
              //       }),
              // ],
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/menu',
              builder: (context, state) {
                return MenuScreen();
              },
              routes: [
                GoRoute(
                    path: 'settings/common',
                    builder: (context, state) {
                      return CommonSettingsScreen();
                    }),
                GoRoute(
                    path: 'settings/user',
                    builder: (context, state) {
                      return UserSettingsScreen();
                    }),
              ],
            )
          ]),
        ])
  ],
);
