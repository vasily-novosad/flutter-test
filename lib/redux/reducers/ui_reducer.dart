import 'package:flutter_test_app/redux/actions/ui_actions.dart';
import 'package:flutter_test_app/redux/states/ui_state.dart';

UIState incrementCounterReducer(state, IncrementCounterAction action) {
  return UIState(counter: state.counter + action.counter);
}

/// UI reducer
UIState uiStateReducer(UIState state, dynamic action) {
  if (action is IncrementCounterAction) {
    return incrementCounterReducer(state, action);
  }

  return state;
}
