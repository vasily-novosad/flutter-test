import 'package:flutter_test_app/graphql/types/access_token.dart';

class TokenBag {
  final AccessToken accessToken;

  TokenBag({required this.accessToken});

  static TokenBag fromJSON(Map<String, dynamic> json) {
    return TokenBag(
      accessToken: AccessToken.fromJSON(json['accessToken']),
    );
  }
}
