import 'package:flutter/material.dart';

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
