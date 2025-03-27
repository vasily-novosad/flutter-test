import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/redux/app/app_state_reducer.dart';
import 'package:redux/redux.dart';

final appStore =
    Store<AppState>(appStateReducer, initialState: AppState());
