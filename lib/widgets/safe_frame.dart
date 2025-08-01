import 'package:flutter/cupertino.dart';

class SafeFrame extends StatelessWidget {
  final Widget children;

  const SafeFrame({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: children,
      ),
    );
  }
}
