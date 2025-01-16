import 'package:flutter_test_app/graphql/types/access_token_payload.dart';

class TokenBag {
  final AccessTokenPayload payload;
  final String token;

  TokenBag({required this.payload, required this.token}) ;
}