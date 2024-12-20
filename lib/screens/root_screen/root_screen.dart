import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/bottom_nav/bottom_nav.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';

class Root extends StatelessWidget {
  final Widget child;

  const Root({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar().getAppBar(context),
        bottomNavigationBar: BottomNav(),
        body: child);
  }
}
