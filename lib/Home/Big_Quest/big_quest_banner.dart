// big_quest_banner.dart
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'big_quest_detail_page.dart';

final List<Map<String, String>> bigQuestData = [
  {
    'title': 'Membersihkan Pantai',
    'description': 'Bersihkan sampah di Pantai Ancol',
    'image': 'assets/beach.jpg',
    'location': 'Pantai Ancol',
    'progress': '13 | 14',
  },
  {
    'title': 'Penanaman Pohon',
    'description': 'Menanam 100 pohon di hutan kota',
    'image': 'assets/beach.jpg',
    'location': 'Hutan Kota',
    'progress': '20 | 50',
  },
  {
    'title': 'Bakti Sosial',
    'description': 'Membantu renovasi panti asuhan',
    'image': 'assets/beach.jpg',
    'location': 'Panti Asuhan Cinta',
    'progress': '5 | 10',
  },
];

Widget buildBigQuestCard(BuildContext context, Map<String, String> quest) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BigQuestDetailPage()),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            quest['image']!,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 180,
            color: AppColor.mainBlack.withOpacity(0.3),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quest['location']!,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  quest['description']!,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                quest['progress']!,
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
