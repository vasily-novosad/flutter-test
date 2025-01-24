import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final _CounterButtonViewModel viewModel = _CounterButtonViewModel(context);
    return Text(viewModel.label);
  }
}

typedef CounterCallback = void Function(int value);

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _CounterButtonViewModel viewModel = _CounterButtonViewModel(context);

    return Button(text: viewModel.label, onPressed: viewModel.onPressed);
  }
}

class _CounterButtonViewModel {
  final BuildContext context;
  const _CounterButtonViewModel(this.context);

  String get label {
    int count =
        Provider.of<CounterProvider>(context, listen: true).counterValue;

    return 'label if $count';
  }

  void onPressed() {
    Provider.of<CounterProvider>(context, listen: false).incrementCounter(1);
  }
}
