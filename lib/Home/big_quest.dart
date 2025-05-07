// big_quest.dart
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/Home/Big_Quest/big_quest_banner.dart';

class BigQuest extends StatelessWidget {
  const BigQuest({super.key});

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildBigQuestCard(context, bigQuestData[0]),
        ),
      ],
    );
  }
}
