import 'package:flutter/material.dart';

import 'colors.dart';

class MainTheme {
  static ThemeData get dartTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ThemeColors.primaryColor,
      scaffoldBackgroundColor: ThemeColors.background,
      appBarTheme: AppBarTheme(),
      primaryColorDark: ThemeColors.primaryColor,
      // buttonTheme: ButtonThemeData(
      //   buttonColor: Colors.blueAccent,
      // ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ThemeColors.primaryColor.withAlpha(100),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: ThemeColors.primaryColor,
        focusColor: ThemeColors.primaryColor,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStatePropertyAll(Colors.transparent),
        checkColor: WidgetStatePropertyAll(ThemeColors.textPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 1,
            color: ThemeColors.textPrimary,
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: ThemeColors.textPrimary,
        ),
        bodySmall: TextStyle(
          color: ThemeColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          color: ThemeColors.textPrimary,
        ),

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
