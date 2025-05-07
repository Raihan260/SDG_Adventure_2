// big_quest_page.dart
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/Home/Big_Quest/big_quest_banner.dart';

class BigQuestPage extends StatefulWidget {
  const BigQuestPage({super.key});

  @override
  State<BigQuestPage> createState() => _BigQuestPageState();
}

class _BigQuestPageState extends State<BigQuestPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> allBigQuests = bigQuestData;

  List<Map<String, String>> filteredQuests = [];

  @override
  void initState() {
    super.initState();
    filteredQuests = allBigQuests;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredQuests = allBigQuests.where((quest) {
        final title = quest['title']!.toLowerCase();
        final description = quest['description']!.toLowerCase();
        return title.contains(query) || description.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.mainGrey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredQuests.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: buildBigQuestCard(context, filteredQuests[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
