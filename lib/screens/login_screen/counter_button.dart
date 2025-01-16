import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/providers/counter_provider.dart';

class CounterButton extends StatelessWidget {
  CounterButton({super.key});

  final CounterProvider counter = CounterProvider();

  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'Incremen this counter',
      onPressed: counter.incrementCounter,
    );
  }
}
