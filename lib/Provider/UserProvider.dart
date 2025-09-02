import 'package:flutter/material.dart';
import 'package:untitled/Models/UserModel.dart';

import '../Services/UserServices.dart';


class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _userProfile;
  bool _isLoading = false;

  UserModel? get userProfile => _userProfile;
  bool get isLoading => _isLoading;

  Future<void> fetchUserProfile(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _userProfile = await _userService.getUserProfile(id);
    } catch (e) {
      print("Error fetching profile: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
