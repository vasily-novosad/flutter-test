import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:flutter_test_app/screens/home_screen/token_informer/token_informer_model.dart';

import 'package:redux/redux.dart';

class TokenInformerViewModel {
  final Store<AppState> store;
  late TokenInformerModel model;

  TokenInformerViewModel(this.store) {
    model = TokenInformerModel(store);
  }

  bool get hasToken =>
      !model.isTokenEmpty(store.state.authState.accessToken.token);

  bool get isPending => store.state.authState.isPending;
  String? get token => store.state.authState.accessToken.token;

  Future<void> requestAuthorization(String login, String password) async {
    return model.requestAuthorization(login, password);
  }

  Future<void> resetToken() async {
    return model.resetToken();
  }
}
