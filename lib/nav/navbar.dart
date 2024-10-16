import 'package:acedemy/Pages/chat.dart';
import 'package:acedemy/Pages/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:acedemy/Pages/homePage.dart';
import 'package:acedemy/Pages/aiSearch.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  _NavViewState createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _currentIndex = 0;
        _pageController.jumpToPage(_currentIndex);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: SnakeNavigationBar.color(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF193238),
        unselectedItemColor: Colors.grey,
        snakeViewColor: Colors.white,
        snakeShape: SnakeShape.circle,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_text)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          ChatBotPage(),
          ChatScreen(),
          UserProfile(),
        ],
      ),
    );
  }
}
