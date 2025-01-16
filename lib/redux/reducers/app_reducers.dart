import 'package:flutter_test_app/redux/reducers/auth_reducer.dart';
import 'package:flutter_test_app/redux/reducers/ui_reducer.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  
  return AppState(
    authState: authentificationReducer(state.authState, action),
    uiState: uiStateReducer(state.uiState, action),
  );
}
