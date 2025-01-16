import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_response.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';
import 'package:flutter_test_app/models/access_token_model.dart';
import 'package:flutter_test_app/services/authenticator.dart';
import 'package:flutter_test_app/services/cache_manager.dart';

class AuthentificationModel {
  final BuildContext context;
  final StorageManager storage = StorageManager(mode: StorageManagerMode.app);

  AuthentificationModel(this.context);

  Future<String?> requestAuthorization(String login, String password) async {
    TokenRegistrationResponse response =
        await Auth().auth(login: login, password: password);

    if (response.error is TokenRegistrationError) {
      return null;
    }

    if (response.success is TokenRegistrationSuccess) {
      TokenRegistrationSuccess data =
          response.success as TokenRegistrationSuccess;
      String? token = data.payload.accessToken.token;

      storage.set(StorageManagerRecord(key: 'token', content: token));

      return token;
    }

    return null;
  }

  Future<void> resetToken() async {
    // store.dispatch(SetTokenAction(''));
    storage.clear('@token');
  }

  bool isTokenEmpty(String? token) {
    return AccessToken.isEmptyToken(token);
  }
}
