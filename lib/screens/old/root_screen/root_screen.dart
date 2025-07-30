import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  final Widget child;

  const Root({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: MyAppbar().getAppBar(context),
        // bottomNavigationBar: BottomNav(),
        body: child,
    );
  }
}
