import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';

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
      decoration: InputDecoration(
        hintText: 'Type here',
        label: Text('Login'),
      ),
    );
  }
}
