import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_response.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';
import 'package:flutter_test_app/redux/actions/auth_actions.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:flutter_test_app/services/authenticator.dart';
import 'package:flutter_test_app/services/storage.dart';
import 'package:redux/redux.dart';

class AuthentificationModel {
  final Store<AppState> store;

  const AuthentificationModel(this.store);

  Future<bool> requestAuthorization(String login, String password) async {
    TokenRegistrationResponse response =
        await Auth().auth(login: login, password: password);

    if (response.error is TokenRegistrationError) {
      return false;
    }

    if (response.success is TokenRegistrationSuccess) {
      TokenRegistrationSuccess data =
          response.success as TokenRegistrationSuccess;
      String? token = data.payload.token;

      store.dispatch(SetTokenAction(token));

      StorageAction storage = await Storage().getStorage();

      storage.setItem('@token', token);

      return true;
    }

    return false;
  }

  Future<void> resetToken() async {
    StorageAction storage = await Storage().getStorage();
    store.dispatch(SetTokenAction(''));
    storage.removeItem('@token');
  }

  bool isTokenEmpty(String? token) {
    return AccessToken.isEmptyToken(token);
  }
}
