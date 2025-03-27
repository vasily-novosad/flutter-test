import 'package:flutter_test_app/redux/auth/auth_state.dart';
import 'package:flutter_test_app/redux/ui/ui_state.dart';

class AppState {
  late UIState ui;
  late AuthState auth;

  AppState({UIState? ui, AuthState? auth}) {
    this.ui = ui ?? UIState();
    this.auth = auth ?? AuthState();
  }
}
