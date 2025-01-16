import 'dart:async';
import 'package:flutter_test_app/graphql/types/token_registration_error.dart';
import 'package:flutter_test_app/graphql/types/token_registration_response.dart';
import 'package:flutter_test_app/graphql/types/token_registration_success.dart';
import 'package:flutter_test_app/services/graphql.dart';

class Auth extends GraphQL {
  Future<TokenRegistrationResponse> auth(
      {required String login, required String password}) async {
    const String query = r'''
      mutation Authentification($login: String!, $password: String!) {
        auth: authentification {
          __typename
          create(login: $login, password: $password) {
            __typename
            ... on Error {
              name
              msg
            }

            ... on TokenRegistrationSuccess {
              payload {
                accessToken {
                  token
                  payload {
                    id
                    type
                  }
                }
              }
              query {
                me {
                  __typename
                  ... on User {
                    id
                    name
                  }
                }
              }
            }
          }
        }
      }
    ''';

    GraphQLResponse data = await request(
      variables: {
        'login': login,
        'password': password,
      },
      operationName: 'Authentification',
      query: query,
      ignoreCache: true,
      noSaveToCache: true,
    );

    return _parseResponse(data);
  }

  TokenRegistrationResponse _parseResponse(GraphQLResponse response) {
    if (response.errors != null) {
      String mess = response.errors?[0].message ?? 'Unknown Error';

      return TokenRegistrationResponse(
        error: TokenRegistrationError(msg: mess, name: 'Network Error'),
      );
    }

    Map<String, dynamic>? create = response.data['auth']['create'];

    TokenRegistrationSuccess? success;
    TokenRegistrationError? error;

    if (create?['__typename'] == 'TokenRegistrationSuccess') {
      success = TokenRegistrationSuccess.fromJSON(create!);
    }

    if (create?['__typename'] == 'TokenRegistrationError') {
      error = TokenRegistrationError.fromJSON(create!);
    }

    return TokenRegistrationResponse(
      success: success,
      error: error,
    );
  }
}
