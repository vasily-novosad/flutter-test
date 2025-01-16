import 'package:flutter_test_app/models/authentification_model.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class LogoutButtonModel {
  final Store<AppState> store;
  late AuthentificationModel authModel;

  LogoutButtonModel(this.store) {
    authModel = AuthentificationModel(store);
  }

  bool get hasToken {
    return !authModel.isTokenEmpty(store.state.authState.accessToken.token);
  }

  Future<void> logoutAction() async {
    await AuthentificationModel(store).resetToken();

    return;
  }
}
