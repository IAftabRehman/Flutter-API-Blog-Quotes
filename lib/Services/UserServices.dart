import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/UserModel.dart';

class UserService {
  final String baseUrl = "https://dummyjson.com/users";

  Future<UserModel> getUserProfile(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception("Failed to fetch user profile");
    }
  }
}
