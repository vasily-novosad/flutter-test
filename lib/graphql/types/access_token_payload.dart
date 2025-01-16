
import 'package:flutter_test_app/graphql/enums/token_type.dart';

class AccessTokenPayload {
  final String id;
  late TokenType type;

  AccessTokenPayload({required this.id, required String type}) {
    switch (type) {
      case 'access':
        this.type = TokenType.access;
      case 'refresh':
        this.type = TokenType.refresh;
      default:
        this.type = TokenType.access;
    }
  }
}