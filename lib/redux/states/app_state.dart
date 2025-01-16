import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:flutter_test_app/redux/states/ui_state.dart';

class AppState {
  final UIState uiState;
  final AuthentificationState authState;

  const AppState({
    this.uiState = const UIState(),
    this.authState = const AuthentificationState(),
  });
}
