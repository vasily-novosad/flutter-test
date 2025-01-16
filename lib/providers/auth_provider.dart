import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  bool _dataFetchingInProgress = false;

  AuthProvider();

  void setToken(String? token) {
    _token = token;
    _dataFetchingInProgress = false;
    notifyListeners();
  }

  void setDataFetchingState(bool? inprogress) {
    _dataFetchingInProgress = inprogress ?? false;
    notifyListeners();
  }

  String? get tokenValue => _token;
  bool get isFetching => _dataFetchingInProgress;
  bool get hasToken {
    String t = _token ?? '';

    return t.isEmpty;
  }
}
