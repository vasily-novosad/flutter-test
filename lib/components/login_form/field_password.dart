import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';
import 'package:flutter_test_app/themes/main/colors.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      controller: FormController.password.controller,
      focusNode: FormController.password.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (_) => FormController.submitForm(context),
      validator: FormValidator.validatePassword,
      cursorColor: ThemeColors.textContrast,
      style: TextStyle(
        fontSize: 14,
        height: 1,
        decorationColor: ThemeColors.primaryColor,
        color: ThemeColors.textContrast,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: ThemeColors.textPrimary,
        filled: true,
        focusColor: ThemeColors.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.primaryColor, width: 2),
        ),
        hintText: 'Пароль',
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.error, width: 2),
        ),
        errorStyle: TextStyle(color: ThemeColors.error),
      ),
    );
  }
}
