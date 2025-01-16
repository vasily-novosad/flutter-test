import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/components/logout_button/logout_button_view_model.dart';

typedef Callback = void Function();

class Converter {
  void Function() callback;
  String token;

  Converter(this.token, this.callback);
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutButtonViewModel viewModel = LogoutButtonViewModel(context);

    if (!viewModel.shouldBeDisplayed) {
      return const SizedBox.shrink();
    }

    return CupertinoButton.filled(
        onPressed: viewModel.clickAction, // prevent formatting
        child: viewModel.label);
  }
}
