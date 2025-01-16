import 'package:flutter_test_app/redux/actions/auth_actions.dart';
import 'package:flutter_test_app/redux/states/auth_state.dart';
import 'package:redux/redux.dart';

AuthentificationState setTokenReducer(
    AuthentificationState state, SetTokenAction action) {
  final AccessToken accessToken = AccessToken(
    token: action.token,
  );

  return AuthentificationState(accessToken: accessToken);
}

AuthentificationState setIsPendingReducer(
    AuthentificationState state, SetPendingAction action) {

  return AuthentificationState(isPending: action.isPending);
}

AuthentificationState authentificationReducer(AuthentificationState state, dynamic action){
  if (action is SetTokenAction) {
    return setTokenReducer(state, action);
  }
  if (action is SetPendingAction) {
    return setIsPendingReducer(state, action);
  }

  return state;
}
// final Reducer<AuthentificationState> authentificationReducer = combineReducers([
//   TypedReducer<AuthentificationState, SetTokenAction>(setTokenReducer),
//   TypedReducer<AuthentificationState, SetPendingAction>(setIsPendingReducer),
// ]);
