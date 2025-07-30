import 'package:flutter/material.dart';

import 'colors.dart';

class MainTheme {
  static ThemeData get dartTheme {
    return ThemeData(
      primaryColor: ThemeColors.primaryColor,
      scaffoldBackgroundColor: ThemeColors.background,
      appBarTheme: AppBarTheme(),
      // buttonTheme: ButtonThemeData(
      //   buttonColor: Colors.blueAccent,
      // ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
        color: ThemeColors.textPrimary,
      )

          // displayLarge: const TextStyle(
          //   // fontSize: 72,
          //   fontWeight: FontWeight.bold,
          // ),
          // ···
          // titleLarge: GoogleFonts.oswald(
          //   fontSize: 30,
          //   fontStyle: FontStyle.italic,
          // ),
          // bodyMedium: GoogleFonts.merriweather(),
          // displaySmall: GoogleFonts.pacifico(),
          ),
    );
  }
}
