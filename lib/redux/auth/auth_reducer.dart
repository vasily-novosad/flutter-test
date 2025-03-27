import 'package:flutter_test_app/redux/auth/auth_actions.dart';
import 'package:flutter_test_app/redux/auth/auth_state.dart';
import 'package:redux/redux.dart';

AuthState setAccessTokenReducer(
    AuthState state, AuthActionSetAccessToken action) {
  return state.copyWith(accessToken: action.value);
}

AuthState setRefreshTokenReducer(
    AuthState state, AuthActionsSetRefreshToken action) {
  return state.copyWith(refreshToken: action.value);
}

AuthState resetAuthReducer(AuthState state, AuthActionsResetAuth action) {
  return AuthState();
}

Reducer<AuthState> authReducer = combineReducers<AuthState>([
  TypedReducer(setAccessTokenReducer).call,
  TypedReducer(setRefreshTokenReducer).call,
  TypedReducer(resetAuthReducer).call,
]);
