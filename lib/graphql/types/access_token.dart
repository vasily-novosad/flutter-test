import 'package:flutter_test_app/graphql/types/access_token_payload.dart';

class AccessToken {
  final AccessTokenPayload payload;
  final String token;

  const AccessToken({required this.payload, required this.token});

  static AccessToken fromJSON(Map<String, dynamic> json) {
    return AccessToken(
        token: json['token'],
        payload: AccessTokenPayload.fromJSON(json['payload']));
  }
}
