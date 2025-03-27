import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/redux/ui/ui_actions.dart';
import 'package:flutter_test_app/redux/ui/ui_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<UIState, _CounterViewModel>(
        converter: (store) => _CounterViewModel(
            counter: store.state.counter,
            incrementCounter: store.dispatch(UIActionIncrementCounter(1))),
        builder: (context, viewModel) {
          return Center(
            child: Button(
              text: viewModel.label,
              onPressed: viewModel.onPressed,
            ),
          );
        });
  }
}

class _CounterViewModel {
  final int counter;
  final Function() incrementCounter;

  _CounterViewModel({
    required this.counter,
    required this.incrementCounter,
  });

  String get label {
    return 'label is $counter';
  }

  void onPressed() => incrementCounter();

  @override
  bool operator ==(Object other) {
    return other is _CounterViewModel && other.counter != counter;
  }

  @override
  int get hashCode => counter.hashCode;
}
