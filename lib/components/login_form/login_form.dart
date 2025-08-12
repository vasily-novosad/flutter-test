import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/field_checkbox.dart';
import 'package:flutter_test_app/components/login_form/field_login.dart';
import 'package:flutter_test_app/components/login_form/field_password.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';
import 'package:flutter_test_app/components/login_form/submit_button.dart';
import 'package:flutter_test_app/themes/main/colors.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Вход',
                style: TextStyle(
                  fontSize: 40,
                  color: ThemeColors.textPrimary,
                ),
              ),
              Text(
                'Логин и пароль вам высылали в смс',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: -0.1,
                  color: ThemeColors.textSecondaty,
                ),
              ),
              Text(
                'от Био-Трансфера',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: -0.1,
                  color: ThemeColors.textSecondaty,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
          FieldLogin(),
          SizedBox(
            height: 20,
          ),
          FieldPassword(),
          FieldCheckbox(
            title: Text(
              "Даю согласие на обработку персональных данных. Политика конфеденциальности",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: ThemeColors.textPrimary,
              ),
            ),
            validator: FormValidator.validateAcceptAgreement,
            controller: FieldAcceptAgreementController(),
          ),
          SizedBox(
            height: 16,
          ),
          SubmitButton(),
        ],
      ),
    );
  }
}
