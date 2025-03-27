class AuthState {
  final String? accessToken;
  final String? refreshToken;

  AuthState({this.accessToken, this.refreshToken});

  AuthState copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
