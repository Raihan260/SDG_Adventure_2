import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class DailyQuest extends StatefulWidget {
  const DailyQuest({super.key});

  @override
  State<DailyQuest> createState() => _DailyQuestState();
}

class _DailyQuestState extends State<DailyQuest> {
  // List Quest, isinya Map {title, completed}
  final List<Map<String, dynamic>> quests = [
    {'title': 'Buang sampah pada tempatnya', 'completed': false},
    {'title': 'Menyiram tanaman', 'completed': false},
    {'title': 'Berbagi pada sesama', 'completed': false},
  ];

  void toggleQuest(int index) {
    setState(() {
      quests[index]['completed'] = !quests[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Quest',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // List semua quest
        ...quests.asMap().entries.map((entry) {
          int idx = entry.key;
          var quest = entry.value;
          return GestureDetector(
            onTap: () => toggleQuest(idx),
            child: _buildQuestItem(quest['title'], quest['completed']),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildQuestItem(String title, bool completed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Icon(
            completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completed ? AppColor.orange : AppColor.mainGrey,
          ),
        ],
      ),
    );
  }
}
