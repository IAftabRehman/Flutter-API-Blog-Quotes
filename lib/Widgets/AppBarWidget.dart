import 'package:flutter/material.dart';
import '../Elements/CustomContainerWidget.dart';
import '../Elements/CustomTextWidget.dart';
import '../Views/ProfileScreen.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  final bool searchIcon;
  final bool profileIcon;
  const AppBarWidget({super.key, required this.title, required this.searchIcon, required this.profileIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !profileIcon ? IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.keyboard_arrow_left, size: 30, color: Colors.white,)) : SizedBox(),
        MyText(
          text: title.toString(),
          color: Colors.white,
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        const Spacer(),
        searchIcon ?
        MyIconContainer(
          icon: Icons.search,
          iconSize: 30,
          iconColor: Colors.white,
        ) : SizedBox(),
        const SizedBox(width: 10),
        profileIcon ? MyIconContainer(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
          icon: Icons.person,
          iconColor: Colors.white,
          iconSize: 30,
        ) : SizedBox()
        
        
      ],
    );
  }
}
