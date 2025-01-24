import 'package:flutter/material.dart';

import 'colors.dart';

class MainTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: surfacePrimary,
    );
  }
}
