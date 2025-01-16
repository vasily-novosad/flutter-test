import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GraphQLError {
  String? message;

  GraphQLError({this.message});
}

class GraphQLResponse<T> {
  final T? data;
  final List<GraphQLError>? errors;

  GraphQLResponse({this.data, this.errors});
}

class GraphQL {
  String endpoint = 'http://localhost:9005/graphql';

  Map<String, dynamic> _parseResponse(String jsonString) {
    Map<String, dynamic> parsed = json.decode(jsonString);

    if (parsed['errors'] == null && parsed['data'] == null) {
      throw 'Request error';
    }

    return parsed;
  }

  Future<GraphQLResponse> request({
    required Map<String, dynamic> variables,
    required String operationName,
    required String query,
  }) async {
    Uri url = Uri.parse(endpoint);
    Map<String, String> headers = {
      'content-type': 'application/json',
      'user-agent': 'flutter:app'
    };

    Object body = jsonEncode({
      'query': query,
      'operationName': operationName,
      'variables': variables,
    });
    int timeout = 30;
    Timer timer = Timer(Duration(seconds: timeout), () => Exception('Request failed. Aborted at $timeout seconds'));


    try {
      http.Response response = await http.post(url, headers: headers, body: body);
      timer.cancel();
      dynamic parseResponse = await compute(_parseResponse, response.body);

      List<GraphQLError> errors = [];

      if (parseResponse['errors'].runtimeType == List) {
        parseResponse['errors'].forEach((error) {
          String m = error['message'];
          errors.add(GraphQLError(message: m));
        });
      }

      return GraphQLResponse(
        data: parseResponse['data'],
        errors: errors.isEmpty ? null : errors,
      );

    } catch(e) {

      String errorMessage = e.toString();
      print('GraphQL Request Error $errorMessage');
      List<GraphQLError> errors = [GraphQLError(message: errorMessage)];

      return GraphQLResponse(errors: errors);
    }
  }
}
