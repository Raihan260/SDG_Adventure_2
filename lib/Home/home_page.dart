import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'big_quest.dart';
import 'daily_quest.dart';
import 'Notification/notif_page.dart';
import 'banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: AppColor.mainBlack
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar----------------------------------------------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.mainGrey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Banner ---------------------------------------------------
              const BannerWidget(),

              const SizedBox(height: 24),

              // Daily Quest ----------------------------------------------
              const DailyQuest(),

              const SizedBox(height: 24),

              // Progress Bar Section -------------------------------------
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.mainBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '19 Bronze (+3)',
                      style: TextStyle(color: AppColor.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Level 1',
                      style: TextStyle(color: AppColor.white),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.3,
                      color: AppColor.orange,
                      backgroundColor: AppColor.mainGrey,
                      minHeight: 6,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Big Quest -------------------------------------------------
              const BigQuest(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
