import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';
import 'package:flutter_test_app/components/login_form/form_validator.dart';

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
      decoration: InputDecoration(
        hintText: 'Type here',
        label: Text('Password'),
      ),
    );
  }
}
