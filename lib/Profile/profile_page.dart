import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdg_adventure_2/Login/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Menghapus semua data login
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 40),
            backgroundColor: AppColor.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(
              fontFamily: 'Montserrat_SemiBold',
              fontSize: 16,
              color: AppColor.mainBlack,
            ),
          ),
        ),
      ),
    );
  }
}