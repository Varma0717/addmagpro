import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import 'api_exception.dart';

class ApiClient {
  final http.Client _http;

  ApiClient({http.Client? httpClient}) : _http = httpClient ?? http.Client();

  Uri _uri(String path) => Uri.parse('${AppConfig.apiBaseUrl}$path');

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    String? bearerToken,
  }) async {
    final response = await _http.post(
      _uri(path),
      headers: _headers(bearerToken),
      body: jsonEncode(body ?? <String, dynamic>{}),
    );

    return _decode(response);
  }

  Future<Map<String, dynamic>> get(
    String path, {
    String? bearerToken,
  }) async {
    final response = await _http.get(
      _uri(path),
      headers: _headers(bearerToken),
    );

    return _decode(response);
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? body,
    String? bearerToken,
  }) async {
    final response = await _http.patch(
      _uri(path),
      headers: _headers(bearerToken),
      body: jsonEncode(body ?? <String, dynamic>{}),
    );

    return _decode(response);
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? body,
    String? bearerToken,
  }) async {
    final response = await _http.delete(
      _uri(path),
      headers: _headers(bearerToken),
      body: body == null ? null : jsonEncode(body),
    );

    return _decode(response);
  }

  Map<String, String> _headers(String? bearerToken) {
    return <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (bearerToken != null && bearerToken.isNotEmpty)
        'Authorization': 'Bearer $bearerToken',
    };
  }

  Map<String, dynamic> _decode(http.Response response) {
    final Map<String, dynamic> payload =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return payload;
    }

    final dynamic errors = payload['errors'];
    if (errors is Map<String, dynamic> && errors.isNotEmpty) {
      final first = errors.values.first;
      if (first is List && first.isNotEmpty) {
        throw ApiException(first.first.toString(), statusCode: response.statusCode);
      }
    }

    throw ApiException(
      (payload['message'] as String?) ?? 'Request failed',
      statusCode: response.statusCode,
    );
  }
}
