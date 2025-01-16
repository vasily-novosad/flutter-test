import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/components/logout_button/logout_button_model.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class LogoutButtonViewModel {
  final Store<AppState> store;
  late LogoutButtonModel model;

  LogoutButtonViewModel(this.store) {
    model = LogoutButtonModel(store);
  }

  Text get label {
    String label = model.hasToken ? 'Logout' : 'Not logged';

    return Text(label);
  }

  bool get shouldBeDisplayed => model.hasToken;

  void clickAction() {
    if (!model.hasToken) {
      return;
    }

    model.logoutAction();
  }
}
