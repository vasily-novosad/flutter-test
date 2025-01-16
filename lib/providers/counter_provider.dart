import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }

  int get counterValue {
    return _count;
  }
}
