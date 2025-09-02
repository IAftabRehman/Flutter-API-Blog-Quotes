import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/UserModel.dart';
import '../Provider/UserProvider.dart';

class UserProfileScreen extends StatelessWidget {
  final int userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: userProvider.isLoading
            ? const CircularProgressIndicator()
            : userProvider.userProfile == null
            ? ElevatedButton(
          onPressed: () {
            userProvider.fetchUserProfile(userId);
          },
          child: const Text("Load Profile"),
        )
            : buildProfile(userProvider.userProfile!),
      ),
    );
  }

  Widget buildProfile(UserModel profile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profile.image),
          ),
          const SizedBox(height: 20),
          Text(profile.name,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Text("@${profile.username}",
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
          const SizedBox(height: 10),
          Text("Email: ${profile.email}"),
          Text("Phone: ${profile.phone}"),
        ],
      ),
    );
  }
}
