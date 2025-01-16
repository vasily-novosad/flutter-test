class TokenRegistrationError {
  final String msg;
  final String name;

  TokenRegistrationError({required this.msg, required this.name});

  static TokenRegistrationError fromJSON(Map<String, dynamic> json) {
    return TokenRegistrationError(msg: json['msg'], name: json['name']);
  }
}
