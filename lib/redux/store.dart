import 'package:redux/redux.dart';
import 'package:flutter_test_app/redux/reducers/app_reducers.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';

Store<AppState> createStore(AppState initialState) {
  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
  );

  return store;
}
