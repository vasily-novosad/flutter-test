import 'package:flutter/material.dart';
import 'package:flutter_test_app/themes/main/colors.dart';
import 'package:flutter_test_app/widgets/base_button.dart';

enum ButtonVariant {
  standard,
  accent,
}

class ColorMap {}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  late ButtonVariant? _variant;

  Button(
      {super.key,
      required this.text,
      required this.onTap,
      ButtonVariant? variant}) {
    _variant = variant ?? ButtonVariant.standard;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> resolveColors() {
      List<Color> list = [];

      if (_variant == ButtonVariant.accent) {
        list.add(ThemeColors.primaryColor);
        list.add(ThemeColors.surface);

        return list;
      }

      list.add(ThemeColors.bottomBarBackground);
      list.add(ThemeColors.textPrimary);
      return list;
    }

    List<Color> colors = resolveColors();

    return BaseButton(
      onTap: onTap,
      color: colors[0],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          text,
          style: TextStyle(
            color: colors[1],
          ),
        ),
      ),
    );
  }
}
