import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/PostModel.dart';
import 'package:http/http.dart' as http;
import '../Models/CommentModel.dart';

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

  Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final response = await http.get(Uri.parse("$baseUrl/$postId/comments"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List commentsJson = data['comments'];
      return commentsJson.map((c) => CommentModel.fromJson(c)).toList();
    } else {
      throw Exception("Failed to fetch comments for post $postId");
    }
  }
}
