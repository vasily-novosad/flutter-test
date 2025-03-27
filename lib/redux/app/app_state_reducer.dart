import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/auth/auth_reducer.dart';
import 'package:flutter_test_app/redux/ui/ui_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    ui: uiReducer(state.ui, action),
    auth: authReducer(state.auth, action),
  );
}
