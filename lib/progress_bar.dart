import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({super.key});

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
    );
  }
}
