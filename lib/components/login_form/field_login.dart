import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';
import 'package:flutter_test_app/themes/main/colors.dart';

class FieldLogin extends StatelessWidget {
  const FieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: FormController.login.controller,
      focusNode: FormController.login.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (_) => FormController.password.focusNode.requestFocus(),
      validator: FormValidator.validateLogin,
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
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: ThemeColors.error, width: 2),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.primaryColor, width: 2),
        ),
        hintText: 'Логин',
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.error, width: 2),
        ),
        errorStyle: TextStyle(color: ThemeColors.error),
      ),
    );
  }
}
