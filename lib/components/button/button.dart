import 'package:flutter/material.dart';
import 'package:flutter_test_app/themes/main/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? disabled;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ThemeColors.bottomBarBackground,
      textColor: ThemeColors.textPrimary,
      elevation: 0,


      onPressed: () {
        if (disabled.runtimeType.toString() == 'boolean' && disabled == true) {
          return;
        }

        onPressed();
      },
      child: Text(text),
    );
  }
}
