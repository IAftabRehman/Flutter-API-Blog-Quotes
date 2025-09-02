import 'package:flutter/material.dart';
import 'package:untitled/Views/CreatePostScreen.dart';
import 'package:untitled/Views/PostScreen.dart';
import 'package:untitled/Views/QuotesScreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PostScreen(),
    QuotesScreen(),
    CreatePostScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.deepPurple,
        backgroundColor: Colors.lightBlue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: "Quotes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "Create",
          ),
        ],
      ),
    );
  }
}
