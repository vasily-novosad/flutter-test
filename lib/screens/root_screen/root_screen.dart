import 'package:flutter/cupertino.dart';

class Root extends StatelessWidget {
  final Widget child;

  const Root({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // appBar: MyAppbar().getAppBar(context),
        // bottomNavigationBar: BottomNav(),
        child: child,
    );
  }
}
