import 'package:flutter/material.dart';
import 'package:library_app/screens/tab/all_books_screen.dart';
import 'package:library_app/screens/tab/category_screen.dart';
import 'package:library_app/screens/tab/profile_screen.dart';

import '../../data/models/library_model.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});
  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activeIndex,
        children: const [
          AllBooksScreen(),
          CategoryScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: activeIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.5),
        selectedFontSize: 16,
        unselectedFontSize: 14,
        onTap: (v) {
          activeIndex = v;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              label: "All Books", icon: Icon(Icons.menu_book_outlined)),
          BottomNavigationBarItem(
              label: "Category", icon: Icon(Icons.my_library_books)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.account_circle_rounded))
        ],
      ),
    );
  }
}
