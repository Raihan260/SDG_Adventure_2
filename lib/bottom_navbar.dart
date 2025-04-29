import 'package:flutter/material.dart';
import 'Home/home_page.dart';
import 'Search/search_page.dart';
import 'Profile/profile_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildNavItem(IconData iconData, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8), // <--- Rounded kecil
        ),
        child: Icon(
          iconData,
          color: isSelected ? Colors.black87 : Colors.white,
          size: 28,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavItem(Icons.home, 0),
            buildNavItem(Icons.menu_book_rounded, 1),
            buildNavItem(Icons.person, 2),
          ],
        ),
      ),
    );
  }
}
