import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';

class TokenRegistrationResponse {
  final TokenRegistrationError? error;
  final TokenRegistrationSuccess? success;

  TokenRegistrationResponse({this.error, this.success});

  static TokenRegistrationResponse fromJSON(Map<String, dynamic> json) {
    return  TokenRegistrationResponse(
      error: json['error'] != null ? TokenRegistrationError.fromJSON(json['error']) : null,
      success: json['success'] != null ? TokenRegistrationSuccess.fromJSON(json['success']) : null,
    );
  }
}
