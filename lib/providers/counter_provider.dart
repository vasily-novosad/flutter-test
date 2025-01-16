import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  void incrementCounter(int value) {
    _count += value;
    notifyListeners();
  }

  int get counterValue {
    return _count;
  }
}
