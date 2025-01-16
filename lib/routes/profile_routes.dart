import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
// import 'package:flutter_test_app/components/bottom_nav/bottom_nav.dart';
import 'package:flutter_test_app/screens/home_info_screen/home_info_screen.dart';
import 'package:flutter_test_app/screens/home_screen/home_screen.dart';
// import 'package:flutter_test_app/screens/login_screen/login_screen.dart';
import 'package:flutter_test_app/screens/second_screen/second_screen.dart';
import 'package:go_router/go_router.dart';

// final List<RouteBase> routes = [
//   ShellRoute(
//     builder: (context, state, child) {
//       return CupertinoPageScaffold(
//         child: child,
//       );
//     },
//     routes: [
//       GoRoute(
//         path: '/login',
//         builder: (context, state) => const LoginScreen(),
//       ),
//     ],
//   ),
//   ShellRoute(
//     builder: (context, state, child) {
//       return CupertinoPageScaffold(
//         child: Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).padding.top,
//             ),
//             child: child,
//           ),
//         // tab: BottomNav(),
//       );
//     },
//     routes: [
//       GoRoute(
//           path: '/profile',
//           builder: (context, state) => const HomeScreen(),
//           routes: [
//             GoRoute(
//                 path: 'info',
//                 builder: (context, state) => const HomeInfoScreen()),
//             GoRoute(
//                 path: 'second',
//                 builder: (context, state) => const SecondScreen()),
//           ]),
//     ],
//   ),
// ];

final List<RouteBase> profileRoutes = [
  ShellRoute(
    builder: (context, state, child) {
      return CupertinoPageScaffold(
        navigationBar: MyAppbar(Text('Home screen')).getAppBar(context),
        // child: child,
        child: SafeArea(child: child),
        // bottomNavigationBar: BottomNav(),
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
          ]),
    ],
  )
];
