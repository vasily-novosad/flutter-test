import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/components/logout_button/logout_button_view_model.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';

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
    return StoreConnector<AppState, LogoutButtonViewModel>(
      converter: (store) => LogoutButtonViewModel(store),
      builder: (context, viewModel) {
        if (!viewModel.shouldBeDisplayed) {
          return const SizedBox.shrink();
        }

        return CupertinoButton.filled(
            onPressed: viewModel.clickAction, // prevent formatting
            child: viewModel.label);
      },
    );
  }
}
