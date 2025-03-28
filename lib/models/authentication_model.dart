import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_response.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';
import 'package:flutter_test_app/models/access_token_model.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/auth/auth_actions.dart';
import 'package:flutter_test_app/services/authenticator.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:redux/redux.dart';

class AuthenticationModel {
  late BuildContext _context;
  late StorageManager _storage = StorageManager(mode: StorageManagerMode.app);
  late Store<AppState> _store;

  AuthenticationModel({
    required BuildContext context,
  }) {
    _context = context;
    _storage = StorageManager(mode: StorageManagerMode.app);
    _store = StoreProvider.of<AppState>(context);
  }

  Future<String?> requestAuthorization(String login, String password) async {
    TokenRegistrationResponse response =
        await Auth(context: _context).auth(login: login, password: password);

    if (response.error is TokenRegistrationError) {
      return null;
    }

    if (response.success is TokenRegistrationSuccess) {
      TokenRegistrationSuccess data =
          response.success as TokenRegistrationSuccess;
      String? token = data.payload.accessToken.token;

      _storage.set(StorageManagerRecord(key: 'token', content: token));
      _store.dispatch(AuthActionSetAccessToken(token));

      return token;
    }

    return null;
  }

  Future<void> resetToken() async {
    _store.dispatch(AuthActionsResetAuth());
    _storage.clear('@token');
  }

  bool isTokenEmpty(String? token) {
    return AccessToken.isEmptyToken(token);
  }
}
