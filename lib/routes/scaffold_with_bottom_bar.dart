import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/widgets/bottom_bar.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithBottomBar({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.white, // navigation bar color
    //   statusBarIconBrightness: Brightness.light, // status bar icons' color
    //   statusBarColor: Colors.red,
    //   systemNavigationBarIconBrightness:
    //       Brightness.light, //navigation bar icons' color
    // ));

    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: BottomBar(navigationShell: navigationShell),
    );
  }
}
