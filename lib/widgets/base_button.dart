import 'package:flutter/material.dart';

import '../themes/main/colors.dart';

class BaseButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool? expanded;

  const BaseButton({
    super.key,
    this.onTap,
    this.expanded,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget render() {
      return SizedBox(
        child: Material(
          borderRadius: BorderRadius.circular(4),
          color: ThemeColors.bottomBarBackground,
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: onTap,
            child: child,
          ),
        ),
      );
    }

    if (expanded != null && expanded!) {
      return Expanded(
        flex: 1,
        child: render(),
      );
    }

    return render();
  }
}
