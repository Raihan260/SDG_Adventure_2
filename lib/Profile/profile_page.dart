import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdg_adventure_2/Login/login_page.dart';
import 'package:sdg_adventure_2/progress_bar.dart';
import 'package:sdg_adventure_2/Home/Notification/notif_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'pengaturan_page.dart';
import 'background_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Hapus data login
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Montserrat_SemiBold',
            color: AppColor.mainBlack,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotifPage()),
              );
            },
            icon: const Icon(
              FluentIcons.alert_32_regular,
              color: AppColor.mainBlack,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Gambar & Avatar
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                //Background ------------------------------------------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/beach.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BackgroundEditPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 23,
                        color: AppColor.mainBlack,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -35,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColor.white,
                        child: const CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('assets/Goal-1.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),

            // Nama & Email
            const Text(
              'User_123',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat_SemiBold',
                fontSize: 18,
                color: AppColor.mainBlack,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'user123@gmail.com',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat_Regular',
                color: AppColor.mainGrey,
              ),
            ),
            const SizedBox(height: 16),

            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProgressBarWidget(
                badgeText: 'Bronze',
                levelText: 'Level 1',
                progressValue: 0,
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Pengaturan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const Icon(Icons.settings, color: AppColor.mainBlack),
                  title: const Text(
                    'Pengaturan',
                    style: TextStyle(
                      fontFamily: 'Montserrat_SemiBold',
                      fontSize: 14,
                      color: AppColor.mainBlack,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PengaturanPage()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.orange,
                  minimumSize: const Size.fromHeight(48),
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
