import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_response.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';
import 'package:flutter_test_app/models/authentification_model.dart';
import 'package:flutter_test_app/redux/actions/auth_actions.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:flutter_test_app/services/authenticator.dart';
import 'package:flutter_test_app/services/storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

class TokenInformerModel {
  final Store<AppState> store;

  TokenInformerModel(this.store);

  bool isTokenEmpty(String? token) {
    return AccessToken.isEmptyToken(store.state.authState.accessToken.token);
  }

  Future<void> requestAuthorization(String login, String password) async {
    await AuthentificationModel(store).requestAuthorization(login, password);
  }

  Future<void> resetToken() async {
    await AuthentificationModel(store).resetToken();
  }

  void displaySuccessmessage(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Cussess'),
            content: Text('Authorization is done'),
            actions: [
              CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
