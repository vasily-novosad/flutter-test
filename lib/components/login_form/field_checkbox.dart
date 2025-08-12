import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/login_form/form_controller.dart';

class FieldCheckbox extends FormField<bool> {
  final FieldAcceptAgreementController? controller;

  FieldCheckbox(
      {super.key,
      Widget? title,
      super.onSaved,
      super.validator,
      bool super.initialValue = false,
      bool autovalidate = false,
      required FieldAcceptAgreementController this.controller})
      : super(builder: (FormFieldState<bool> state) {
          return CheckboxListTile(
            dense: state.hasError,
            title: title,
            value: state.value,
            onChanged: (value) {
              state.didChange(value);
              controller.controller.value = value ?? false;
            },
            subtitle: state.hasError
                ? Builder(
                    builder: (BuildContext context) => Text(
                      state.errorText ?? "",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                : null,
            controlAffinity: ListTileControlAffinity.leading,
          );
        });
}
