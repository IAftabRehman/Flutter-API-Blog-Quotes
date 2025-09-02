import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/PostModel.dart';

class PostServices {
  final String baseUrl = "https://dummyjson.com/posts";

  Future<List<PostModel>> getAllPosts() async {
    final response = await http.get(Uri.parse("$baseUrl?limit=50"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List postsJson = data['posts'];
      return postsJson.map((p) => PostModel.fromJson(p)).toList();
    } else {
      throw Exception("Failed to fetch posts");
    }
  }
}

