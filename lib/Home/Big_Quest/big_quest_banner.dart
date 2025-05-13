// big_quest_banner.dart
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'big_quest_detail_page.dart';
import 'package:sdg_adventure_2/utils/Big_quest_banner.dart';
import 'package:sdg_adventure_2/utils/Big_quest_detail.dart'; // ← Tambahkan ini

Widget buildBigQuestCard(BuildContext context, BigQuestBanner item) {
  return GestureDetector(
    onTap: () {
      // Mengambil detail quest berdasarkan itemId
      final String detail = (item.itemId);

      if (detail != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BigQuestDetailPage(
              itemId: item.itemId,
              detailId: detail,
            ),
          ),
        );
      } else {
        // Fallback kalau data tidak ditemukan
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Detail tidak ditemukan")),
        );
      }
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            "assets/${item.imageUrl}",
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
                  item.location,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
                "SDG: ${item.sdg.join(', ')}",
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