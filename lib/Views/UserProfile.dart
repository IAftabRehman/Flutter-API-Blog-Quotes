import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/PostProvider.dart';
import '../Elements/CustomContainerWidget.dart';
import '../Elements/CustomTextWidget.dart';
import '../Provider/UserProvider.dart';
import '../Widgets/AppBarWidget.dart';

class UserProfileScreen extends StatefulWidget {
  final int userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false).fetchUserProfile(
            widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final postProvider = Provider.of<PostProvider>(context);
    final fetch = userProvider.userProfile;

    return Scaffold(
      body: SafeArea(
        child: MyContainer(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBarWidget(
                title: "Profile",
                searchIcon: false,
                profileIcon: false,
              ),

              // 🔹 Add loading and null checks here
              if (userProvider.isLoading) ...[
                const Center(
                    child: CircularProgressIndicator(color: Colors.white)),
              ] else
                if (fetch == null) ...[
                  const Center(
                    child: Text("No profile data found",
                        style: TextStyle(color: Colors.white)),
                  ),
                ] else
                  ...[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: fetch.image != null
                                ? NetworkImage(fetch.image!)
                                : null,
                            child: fetch.image == null
                                ? const Icon(Icons.person, size: 60)
                                : null,
                          ),
                          const SizedBox(height: 20),
                          MyText(
                            text: fetch.name ?? "Unknown",
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          MyText(
                            text: "@${fetch.username ?? "username"}",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              MyText(
                                text: "Email: ",
                                size: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                text: fetch.email ?? "-",
                                size: 16,
                                color: Colors.white60,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyText(
                                text: "Phone: ",
                                size: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                text: fetch.phone ?? "-",
                                size: 16,
                                color: Colors.white60,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

              Expanded(
                child: ListView.builder(
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    final post = postProvider.posts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyContainer(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: MyText(
                                text: post.title,
                                color: Colors.white,
                                size: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            MyContainer(
                              child: MyText(
                                text: post.body,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}