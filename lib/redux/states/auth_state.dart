class AuthentificationState {
  final AccessToken accessToken;
  final bool isPending;

  const AuthentificationState({
    this.accessToken = const AccessToken(),
    this.isPending = false,
  });
}

class AccessToken {
  final String? token;

  static bool isEmptyToken(String? tokenString) {
    return tokenString == null ||
        tokenString == '<no-token>' ||
        tokenString == '';
  }

  const AccessToken({
    this.token = '<no-token>',
  });
}
