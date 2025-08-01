import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/common_settings_screen.dart';
import 'package:flutter_test_app/screens/discharge_screen.dart';
import 'package:flutter_test_app/screens/help_screen.dart';
import 'package:flutter_test_app/screens/home_screen.dart';
import 'package:flutter_test_app/screens/menu_screen.dart';
import 'package:flutter_test_app/screens/profile_screen.dart';
import 'package:flutter_test_app/screens/shift_opan_select_wheels.dart';
import 'package:flutter_test_app/screens/shift_open_camera_view_screen.dart';
import 'package:flutter_test_app/screens/shift_open_photos.dart';
import 'package:flutter_test_app/screens/transfer_screen.dart';
import 'package:flutter_test_app/screens/transfers_screen.dart';
import 'package:flutter_test_app/screens/user_settings_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/profile_change_password_screen.dart';
import 'scaffold_with_bottom_bar.dart';

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
          return ScaffoldWithBottomBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'transfer/:id', // will be -> /home/transfers
                    builder: (context, state) {
                      String id = state.pathParameters['id'] ?? '<no-id>';

                      return TransferScreen(transferID: id);
                    },
                  ),
                  GoRoute(
                    path: 'profile',
                    builder: (context, state) => ProfileScreen(),
                    routes: [
                      GoRoute(
                        path: 'password-change',
                        builder: (context, state) =>
                            ProfileChangePasswordScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'shift-open',
                    builder: (context, state) => ShiftOpenSelectWheelsScreen(),
                    routes: [
                      GoRoute(
                        path: 'photos',
                        builder: (context, state) => ShiftOpenPhotosScreen(),
                        routes: [
                          GoRoute(
                            path: 'camera',
                            builder: (context, state) {
                              // int index =
                              //     state.pathParameters['index'] as int ?? -1;

                              return ShiftOpenCameraViewScreen();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/transfers',
              builder: (context, state) => TransfersScreen(),
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
