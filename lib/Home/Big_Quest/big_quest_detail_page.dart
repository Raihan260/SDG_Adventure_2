import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/Utils/Big_quest_banner.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/utils/Mock_data.dart';
import 'package:sdg_adventure_2/utils/Big_quest_detail.dart';

class BigQuestDetailPage extends StatelessWidget {
  final String itemId;
  final String detailId;

  const BigQuestDetailPage({
    super.key,
    required this.itemId,
    required this.detailId,
  });

  @override
  Widget build(BuildContext context) {
    final item = getItemById(itemId);
    final detail = getItemDetailById(detailId);

    // Null check
    if (item == null || detail == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
        body: const Center(
          child: Text("Data not found."),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        title: const Text(
          'Detail',
          style: TextStyle(color: AppColor.mainBlack),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.mainBlack),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.mainBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.mainGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(FluentIcons.people_24_regular, color: AppColor.orange),
                  SizedBox(width: 8),
                  Text(
                    "90 Pendaftar",
                    style: TextStyle(fontSize: 14, color: AppColor.mainBlack),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(FluentIcons.calendar_24_regular, color: AppColor.orange),
                  SizedBox(width: 8),
                  Text(
                    "Sabtu, 12 Januari 2024",
                    style: TextStyle(fontSize: 14, color: AppColor.mainBlack),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Daftar Tugas",
            style: const TextStyle(fontSize: 16, color: AppColor.mainBlack),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.quest.map((point) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            "Hadiah",
            style: const TextStyle(fontSize: 16, color: AppColor.mainBlack),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.reward.map((point) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            "Penyelenggara",
            style: const TextStyle(fontSize: 16, color: AppColor.mainBlack),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.organizer.map((point) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            "Sponsor",
            style: const TextStyle(fontSize: 16, color: AppColor.mainBlack),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detail.sponsor.map((point) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            minimumSize: const Size(364, 48),
          ),
          child: const Text(
            "Daftar",
            style: TextStyle(color: AppColor.mainBlack),
          ),
        ),
        ],
      ),
    );
  }
}