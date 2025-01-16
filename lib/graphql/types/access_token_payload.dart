import 'package:flutter_test_app/graphql/enums/token_type.dart';

final class AccessTokenPayload {
  final String id;
  final TokenType type;

  const AccessTokenPayload({
    required this.id,
    required this.type,
  });

  static TokenType parseType(String type) {
    switch (type) {
      case 'access':
        return TokenType.access;
      case 'refresh':
        return TokenType.refresh;
      default:
        return TokenType.access;
    }
  }

  static AccessTokenPayload fromJSON(Map<String, dynamic> json) {
    return AccessTokenPayload(
      id: json['id'],
      type: AccessTokenPayload.parseType(json['type']),
    );
  }
}
