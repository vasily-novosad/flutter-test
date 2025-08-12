import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';
import 'package:flutter_test_app/widgets/button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'Отправить',
      variant: ButtonVariant.accent,
      onTap: () => FormController.submitForm(context),
    );
  }
}
