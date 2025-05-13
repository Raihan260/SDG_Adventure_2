import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/Home/Notification/notif_page.dart';


class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        title: const Text(
          'Course', 
          style: TextStyle(
            color: AppColor.mainBlack, 
            fontSize: 16
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.base,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotifPage()),
              );
            },
            icon: const Icon(FluentIcons.alert_32_regular, color: AppColor.mainBlack),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kamu bagian dari perubahan.\nMulai dari sini!",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.orange
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Sustainable Development Goals (SDGs)\nadalah 17 tujuan global untuk menciptakan\ndunia yang lebih adil, sehat, dan\nberkelanjutan. Yuk, kenali lebih dalam dan\njadilah bagian dari perubahan!",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.mainBlack
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              double itemWidth = (maxWidth - 16) / 2; // 2 kolom dengan jarak 8

              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 1; i <= 17; i++)
                    SizedBox(
                      width: itemWidth,
                      child: Image.asset(
                        'assets/Goal-$i.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}