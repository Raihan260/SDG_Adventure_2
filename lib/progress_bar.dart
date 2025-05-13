import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class ProgressBarWidget extends StatelessWidget {
  final String badgeText;
  final String levelText;
  final double progressValue;

  const ProgressBarWidget({
    super.key,
    required this.badgeText,
    required this.levelText,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.mainBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            badgeText,
            style: const TextStyle(color: AppColor.white),
          ),
          const SizedBox(height: 8),
          Text(
            levelText,
            style: const TextStyle(color: AppColor.white),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progressValue,
            color: AppColor.orange,
            backgroundColor: AppColor.mainGrey,
            minHeight: 6,
          ),
        ],
      ),
    );
  }
}
