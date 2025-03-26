import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:developer';

final class GraphQLError {
  String? message;

  GraphQLError({this.message});
}

final class GraphQLResponse<T> {
  final T? data;
  final List<GraphQLError>? errors;
  GraphQLResponse({this.data, this.errors});
}

class GraphQL {
  final StorageManager cacheManager =
      StorageManager(mode: StorageManagerMode.cache);

  String endpoint = 'https://crm.bio-transfer.ru/graphql';

  Map<String, dynamic> _parseResponse(String jsonString) {
    Map<String, dynamic> parsed = json.decode(jsonString);

    if (parsed['errors'] == null && parsed['data'] == null) {
      throw 'Request error';
    }

    return parsed;
  }

  Future<GraphQLResponse> request({
    required String query,
    required String operationName,
    required Map<String, dynamic> variables,
    Map<String, String>? headers,
    bool? ignoreCache,
    bool? noSaveToCache,
  }) async {
    // Compile the cache key
    Uint8List bytes = utf8.encode(jsonEncode({
      'query': query,
      'operationName': operationName,
      'variables': variables,
      'headers': headers,
    }).toString()); // data being hashed
    String cacheKey = sha1.convert(bytes).toString();

    // Check the cache
    if (ignoreCache == null || !ignoreCache) {
      StorageManagerRecord? cached = await cacheManager.get(cacheKey);

      if (cached != null) {
        String content = cached.content;
        Map<String, dynamic> json = jsonDecode(content);

        List<GraphQLError> errors =
            GraphQL.parseErrors(json['response']['errors']);
        GraphQLResponse graphQLResponse = GraphQLResponse(
          data: json['response']['data'],
          errors: errors.isEmpty ? null : errors,
        );

        return graphQLResponse;
      }
    }

    Uri url = Uri.parse(endpoint);
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'user-agent': 'flutter:app'
    };

    if (headers is Map) {
      headers?.forEach((key, value) {
        requestHeaders[key] = value;
      });
    }

    log('GraphQL request [Endpoint: ${url.toString()}]');

    Object body = jsonEncode({
      'query': query,
      'operationName': operationName,
      'variables': variables,
    });
    int timeout = 30;
    Timer timer = Timer(Duration(seconds: timeout),
        () => Exception('Request failed. Aborted at $timeout seconds'));

    try {
      http.Response response =
          await http.post(url, headers: requestHeaders, body: body);
      timer.cancel();

      dynamic parseResponse = await compute(_parseResponse, response.body);

      List<GraphQLError> errors = GraphQL.parseErrors(parseResponse['errors']);
      GraphQLResponse graphQLResponse = GraphQLResponse(
        data: parseResponse['data'],
        errors: errors.isEmpty ? null : errors,
      );

      // Save response into the cache
      if ((noSaveToCache == null || !noSaveToCache)) {
        await cacheManager.set(StorageManagerRecord(
            key: cacheKey,
            expiredAt: DateTime(2025, 9, 1),
            content: jsonEncode({
              'response': {
                'data': parseResponse['data'],
                'errors': errors.isEmpty ? null : parseResponse['errors'],
              }
            })));
      }
      return graphQLResponse;
    } catch (e) {
      String errorMessage = e.toString();
      log('GraphQL Request Error $errorMessage');
      List<GraphQLError> errors = [GraphQLError(message: errorMessage)];

      return GraphQLResponse(errors: errors);
    }
  }

  static List<GraphQLError> parseErrors(dynamic errorResponseJSON) {
    List<GraphQLError> errors = [];

    if (errorResponseJSON.runtimeType == List) {
      errorResponseJSON.forEach((error) {
        String m = error['message'];
        errors.add(GraphQLError(message: m));
      });
    }

    return errors;
  }
}
