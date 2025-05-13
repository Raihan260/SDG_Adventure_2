import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:sdg_adventure_2/utils/Big_quest_banner.dart';
import 'package:sdg_adventure_2/utils/Mock_data.dart';

class BigQuestPage extends StatefulWidget {
  const BigQuestPage({super.key});

  @override
  State<BigQuestPage> createState() => _BigQuestPageState();
}

class _BigQuestPageState extends State<BigQuestPage> {
  final TextEditingController _searchController = TextEditingController();
  List<BigQuestBanner> filteredQuests = [];

  @override
  void initState() {
    super.initState();
    filteredQuests = bigQuestBanner; // dari Mock_data.dart
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredQuests = bigQuestBanner.where((quest) {
        final title = quest.title.toLowerCase();
        final location = quest.location.toLowerCase();
        return title.contains(query) || location.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
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
                child: filteredQuests.isEmpty
                    ? const Center(
                        child: Text(
                          "No quests found.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
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

  Widget buildBigQuestCard(BuildContext context, BigQuestBanner quest) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text(quest.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(quest.location),
      leading: Image.asset('assets/${quest.imageUrl}', width: 50, height: 50, fit: BoxFit.cover),
      onTap: () {
        // Navigasi ke detail quest bisa ditambahkan di sini
        // Misal: Navigator.push(...)
      },
    );
  }
}
