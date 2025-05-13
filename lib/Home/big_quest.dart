import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/utils/Big_quest_banner.dart'; // gunakan lowercase untuk konsistensi
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/home/Big_Quest/big_quest_banner.dart'; // lowercase
import 'package:sdg_adventure_2/utils/Mock_data.dart'; // lowercase

class BigQuest extends StatefulWidget {
  const BigQuest({super.key});

  @override
  State<BigQuest> createState() => _BigQuestState();
}

class _BigQuestState extends State<BigQuest> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<BigQuestBanner> quests = bigQuestBanner;
    final int displayedItemCount = quests.length > 3 ? 3 : quests.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Big Quest",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: displayedItemCount,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: buildBigQuestCard(context, quests[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            displayedItemCount,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 12 : 8,
              height: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColor.orange
                    : AppColor.mainGrey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}