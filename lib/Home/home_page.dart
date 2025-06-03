import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'big_quest.dart';
import 'daily_quest.dart';
import 'Notification/notif_page.dart';
import 'banner.dart';
import 'Big_Quest/big_quest_page.dart'; // tambahkan import ini
import 'package:sdg_adventure_2/progress_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        title: const Text(
          'Home',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar jadi tombol -------------------------------------------------
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BigQuestPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.mainGrey.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(FluentIcons.search_24_filled, color: AppColor.mainGrey),
                      SizedBox(width: 8),
                      Text(
                        'Search',
                        style: TextStyle(color: AppColor.mainGrey),
                      ),
                    ],
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
              const ProgressBarWidget(
                badgeText: 'SDG pemula',
                levelText: 'Level 1',
                progressValue: 0,
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
