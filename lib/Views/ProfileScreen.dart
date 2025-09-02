import 'package:flutter/material.dart';
import 'package:untitled/Elements/CustomImageView.dart';

import '../Elements/CustomContainerWidget.dart';
import '../Elements/CustomTextWidget.dart';
import '../Widgets/AppBarWidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyContainer(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

              CommonImageView(
                imagePath: "assets/images/image.png",
                radius: 100,
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 10),
              MyText(
                text: "Aftab Ur Rehman",
                size: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 5),
              MyText(
                text: "iamaftabrehman@gmail.com",
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customValueWithTitle("127", "Posts"),
                  const SizedBox(width: 25),
                  VerticalDivider(color: Colors.white),
                  customValueWithTitle("2.4k", "Likes"),
                  const SizedBox(width: 25),
                  customValueWithTitle("15.2k", "Views"),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  Column customValueWithTitle(String value, String title) {
    return Column(
      children: [
        MyText(text: value, size: 17, color: Colors.white),
        const SizedBox(height: 2),
        MyText(text: title, size: 14, color: Colors.grey),
      ],
    );
  }
}
