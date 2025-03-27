import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/models/authentication_model.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:go_router/go_router.dart';

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

      AuthenticationModel(store: StoreProvider.of<AppState>(context))
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
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error')));
    }
  }
}
