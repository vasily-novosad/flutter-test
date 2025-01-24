import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => FormController.submitForm(context),
      child: const Text('Submit'),
    );
  }
}
