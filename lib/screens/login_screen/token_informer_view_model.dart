
class TokenInformerViewModel {
  late String _tokenValue;

  TokenInformerViewModel(String? token) {
    _tokenValue = token ?? '';
  }

  String get token => _tokenValue;

  @override
  bool operator ==(Object other) {
    return other is TokenInformerViewModel &&
        (other._tokenValue == _tokenValue);
  }

  @override
  int get hashCode => _tokenValue.hashCode;
}
