import 'package:flutter_test_app/graphql/types/token_bag.dart';

class TokenRegistrationSuccess {
  final TokenBag payload;

  TokenRegistrationSuccess({required this.payload});

  static TokenRegistrationSuccess fromJSON(Map<String, dynamic> json) {
    return TokenRegistrationSuccess(
        payload: TokenBag.fromJSON(json['payload']));
  }
}
