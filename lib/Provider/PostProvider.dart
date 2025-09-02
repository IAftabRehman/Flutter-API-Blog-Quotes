import 'package:flutter/material.dart';
import 'package:untitled/Services/PostServices.dart';
import '../Models/PostModel.dart';

class PostProvider extends ChangeNotifier {
  final PostServices _service = PostServices();
  List<PostModel> posts = [];
  bool isLoading = false;

  Future<void> fetchPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      posts = await _service.getAllPosts();
    } catch (e) {
      debugPrint("Error fetching posts: $e");
      posts = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
