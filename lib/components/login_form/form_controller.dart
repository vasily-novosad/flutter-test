import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/authentification_model.dart';
import 'package:flutter_test_app/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final class FieldLoginController {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
}

final class FieldPasswordController {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
}

final class FormController {
  static final FieldLoginController login = FieldLoginController();
  static final FieldPasswordController password = FieldPasswordController();
  static final formKey = GlobalKey<FormState>();

  static submitForm(BuildContext context) {
    bool isValid = FormController.formKey.currentState!.validate();

    if (isValid) {
      String login = FormController.login.controller.value.text.trim();
      String password = FormController.password.controller.value.text.trim();

      AuthentificationModel(context)
          .requestAuthorization(login, password)
          .then((maybeToken) {
        if (context.mounted) {
          if (maybeToken is String) {
            FormController.formKey.currentState!.reset();

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Success')));
            GoRouter.of(context).go('/profile');
          }

          if (maybeToken == null) {
            FormController.password.controller.clear();
            FormController.password.focusNode.requestFocus();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Failure')));
          }

          Provider.of<AuthProvider>(context, listen: false)
              .setToken(maybeToken);
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error')));
    }
  }
}

class FormValidator {
  static String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
