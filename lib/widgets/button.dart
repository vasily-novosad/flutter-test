import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/base_button.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const Button({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(text),
      ),
    );
  }
}
