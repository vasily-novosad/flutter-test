import 'package:flutter/material.dart';

import '../../themes/main/colors.dart';

class Surface extends StatelessWidget {
  final Widget child;

  const Surface({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColors.bottomBarBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withAlpha(10),
            blurRadius: 8,
            spreadRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
