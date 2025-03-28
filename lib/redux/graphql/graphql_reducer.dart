import 'package:flutter_test_app/redux/graphql/graphql_actions.dart';
import 'package:flutter_test_app/redux/graphql/graphql_state.dart';
import 'package:redux/redux.dart';

GraphQlState setEndpoints(
    GraphQlState state, GraphQLActionSetEndpoints action) {
  return state.copyWith(
    endpoint: action.endpoint,
    subscription: action.subscription,
  );
}

Reducer<GraphQlState> authReducer = combineReducers<GraphQlState>([
  TypedReducer(setEndpoints).call,
]);
