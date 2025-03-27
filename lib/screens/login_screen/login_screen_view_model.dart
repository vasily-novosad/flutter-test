import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/models/authentication_model.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/auth/auth_actions.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:redux/redux.dart';

class LoginScreenViewModel {
  final BuildContext context;
  final StorageManager storage = StorageManager(mode: StorageManagerMode.app);
  late AuthenticationModel authModel;
  late String? tokenValue;
  late Store<AppState> store;

  LoginScreenViewModel(this.context) {
    store = StoreProvider.of<AppState>(context);
    authModel = AuthenticationModel(store: store);
    tokenValue = null;
  }

  bool get isFetching => false;

  String? get token => tokenValue;

  String get autologinButtonLabel =>
      tokenValue != null ? 'Logout' : 'Autologin';

  Future<void> autologinButtonPress() async {
    if (tokenValue != null) {
      authModel.resetToken();

      await storage.clear('@token');

      return;
    }

    return authModel.requestAuthorization('dev', 'dev').then((maybeToken) {
      store.dispatch(AuthActionSetAccessToken(maybeToken ?? ''));
    });
  }

  Future<void> resetToken() async {
    authModel.resetToken();
  }
}
