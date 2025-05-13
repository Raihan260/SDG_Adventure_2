import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/utils/Big_quest_banner.dart';
import 'package:sdg_adventure_2/utils/Mock_data.dart';
import 'package:sdg_adventure_2/Home/Big_Quest/big_quest_banner.dart'; // buildBigQuestCard()

class BigQuestPage extends StatefulWidget {
  @override
  _BigQuestPageState createState() => _BigQuestPageState();
}

class _BigQuestPageState extends State<BigQuestPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<BigQuestBanner> allBigQuests = bigQuestBanner;
  List<BigQuestBanner> filteredQuests = [];

  @override
  void initState() {
    super.initState();
    filteredQuests = allBigQuests; // Tampilkan semua awalnya
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredQuests = allBigQuests.where((quest) {
        final title = quest.title.toLowerCase();
        final location = quest.location.toLowerCase();
        return title.contains(query) || location.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Big Quest'),
        backgroundColor: AppColor.base,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari quest berdasarkan judul atau lokasi...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredQuests.isEmpty
                ? Center(child: Text("Tidak ada quest ditemukan."))
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredQuests.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return buildBigQuestCard(context, filteredQuests[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
