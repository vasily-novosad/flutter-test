import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterValue extends StatelessWidget {
  const CounterValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(builder: (context, counterProvider, _) {
      final int counter = counterProvider.counterValue;

      print('the counter values is «${counter.toString()}»');

      return Text('counter: ${counter.toString()}');
    });
  }
}
