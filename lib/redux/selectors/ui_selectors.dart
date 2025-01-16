import 'package:flutter_test_app/redux/states/app_state.dart';

int counterSelector(AppState state) => state.uiState.counter;


