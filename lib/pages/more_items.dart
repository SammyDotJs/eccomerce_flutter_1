import 'package:ecommerce_app_1/pages/cart_page.dart';
import 'package:ecommerce_app_1/pages/home_page.dart';
import 'package:ecommerce_app_1/pages/intro_page.dart';
import 'package:flutter/material.dart';

class MoreItems extends StatefulWidget {
  const MoreItems({super.key});

  @override
  State<MoreItems> createState() => _MoreItemsState();
}

class _MoreItemsState extends State<MoreItems> {
  int _index = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _index = index;
    });
  }

  final List _pages = [HomePage(), CartPage(), IntroPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: _pages[_index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          onTap: _navigateBottomBar,
          elevation: 0,
          items: [
            // Home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            // Profile
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            // Settings
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          selectedItemColor: Colors.blue,
          // backgroundColor: Colors.grey[800],
        ),
      ),
    );
  }
}
