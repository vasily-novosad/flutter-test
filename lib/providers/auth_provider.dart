import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  AuthProvider();

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  String? get tokenValue {
    return _token;
  }
}
