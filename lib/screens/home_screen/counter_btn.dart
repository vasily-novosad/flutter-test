import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/redux/actions/ui_actions.dart';
import 'package:flutter_test_app/redux/selectors/ui_selectors.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => counterSelector(store.state),
      builder: (context, value) {
        return Text(value.toString());
      },
    );
  }
}

typedef CounterCallback = void Function(int value);

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _CounterButtonViewModel>(
      converter: (store) => _CounterButtonViewModel(store),
      builder: (context, vm) {
        final String currentValue = vm.counter.toString();

        return Button(
          text: 'Increment up to $currentValue',
          onPressed: () => vm.incrementCounter(5),
        );
      },
    );
  }
}

class _CounterButtonViewModel {
  final Store<AppState> store;

  const _CounterButtonViewModel(this.store);

  int get counter => store.state.uiState.counter;

  void incrementCounter(int value) {
    store.dispatch(IncrementCounterAction(value));
  }
}
