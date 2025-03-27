import 'package:flutter_test_app/redux/ui/ui_actions.dart';
import 'package:flutter_test_app/redux/ui/ui_state.dart';
import 'package:redux/redux.dart';

UIState setCounterReducer(UIState state, UIActionSetCounter action) {
  return state.copyWith(counter: action.value);
}

UIState setFontNameReducer(UIState state, UIActionSetFontName action) {
  return state.copyWith(fontName: action.fontName);
}

Reducer<UIState> uiReducer = combineReducers([
  TypedReducer(setCounterReducer).call,
  TypedReducer(setFontNameReducer).call,
]);
