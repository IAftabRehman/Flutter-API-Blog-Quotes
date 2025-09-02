import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String? _token;

  String? get token => _token;

  Future<bool> login(String username, String password) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _token = data['token'];

      await _storage.write(key: "auth_token", value: _token);

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }


  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: "auth_token");
    notifyListeners();
  }
}
