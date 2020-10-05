import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_bloc/constant/constant.dart';

abstract class IAuthenticationRemoteDataSource {
  Future<String> createRequestToken();

  Future<String> createSessionWithLogin(String username, String password, String tokenKey);

  Future<String> createSession(String tokenKey);

  Future<bool> deleteSession(String sessionId);
}

class AuthenticationRemoteDataSource implements IAuthenticationRemoteDataSource {
  @override
  Future<String> createRequestToken() async {
    http.Response response =
        await http.get('$API_URL/authentication/token/new?api_key=$API_KEY');
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      print("Request Token: $responseMap['request_token']");
      return responseMap['request_token'];
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<String> createSession(String tokenKey) async {
    http.Response response = await http.post(
        '$API_URL/authentication/session/new?api_key=$API_KEY',
        body: {
          'request_token': tokenKey,
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      print("Session ID: $responseMap['session_id']");
      return responseMap['session_id'];
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<String> createSessionWithLogin(
      String username, String password, String tokenKey) async {
    http.Response response = await http.post(
        '$API_URL/authentication/token/validate_with_login?api_key=$API_KEY',
        body: {
          'username': username,
          'password': password,
          'request_token': tokenKey,
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      print("Validate Token: $responseMap['request_token']");
      return responseMap['request_token'];
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    http.Response response =
        await http.delete('$API_URL/authentication/session?api_key=$API_KEY');
    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = json.decode(response.body);
      return responseMap['success'];
    } else {
      throw Exception("Error");
    }
  }
}
