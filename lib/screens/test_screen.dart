import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/themes/main/colors.dart';

import '../components/appbar/appbar.dart';
import '../widgets/safe_frame.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MyAppbar(title: 'Мои смены'),
          CounterWidget(),
          Text(
            "Text the text",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  // @override
  // State<StatefulWidget> createState() {
  //   return _CounterState();
  // }

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<CounterWidget> {
  int _counter = 0;
  final String prefix = 's_';

  void increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          onPressed: increment,
          child: Text('Send'),
        ),
        Text("$prefix $_counter"),
      ],
    );
  }
}
