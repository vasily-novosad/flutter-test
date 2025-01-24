import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/field_login.dart';
import 'package:flutter_test_app/components/login_form/field_password.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';
import 'package:flutter_test_app/components/login_form/submit_button.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key}) {
    FormController.login.controller.clear();
    FormController.password.controller.clear();
    FormController.login.focusNode.requestFocus();
  }

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormController.formKey,
      child: Column(
        children: <Widget>[
          FieldLogin(),
          FieldPassword(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SubmitButton(),
          )
        ],
      ),
    );
  }
}
