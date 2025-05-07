import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.orange,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(FluentIcons.home_32_filled),
            activeIcon: Icon(FluentIcons.home_32_filled),
            label: "Home"
          ),
          BottomNavigationBarItem(icon: Icon(FluentIcons.book_32_filled),
            activeIcon: Icon(FluentIcons.book_32_filled),
            label: "Course"
          ),
          BottomNavigationBarItem(icon: Icon(FluentIcons.person_32_filled),
            activeIcon: Icon(FluentIcons.person_32_filled),
            label: "Profile"
          )
        ],
      )
    );
  }
}
