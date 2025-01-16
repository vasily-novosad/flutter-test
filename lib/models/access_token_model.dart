class AccessToken {
  final String token;

  const AccessToken(this.token);

  static bool isEmptyToken(String? tokenString) {
    return tokenString == null || tokenString.isEmpty;
  }
}
