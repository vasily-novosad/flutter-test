import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';

class TokenRegistrationResponse {
  final TokenRegistrationError? error;
  final TokenRegistrationSuccess? success;

  TokenRegistrationResponse({this.error, this.success});
}
