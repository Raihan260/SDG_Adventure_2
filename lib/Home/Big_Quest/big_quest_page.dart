import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'big_quest_detail_page.dart';

class BigQuestPage extends StatefulWidget {
  const BigQuestPage({super.key});

  @override
  State<BigQuestPage> createState() => _BigQuestPageState();
}

class _BigQuestPageState extends State<BigQuestPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> allBigQuests = [
    {
      'title': 'Membersihkan Pantai',
      'description': 'Bersihkan sampah di Pantai Ancol',
      'image': 'assets/beach.jpg',
    },
    {
      'title': 'Penanaman Pohon',
      'description': 'Menanam 100 pohon di hutan kota',
      'image': 'assets/beach.jpg',
    },
    {
      'title': 'Bakti Sosial',
      'description': 'Membantu renovasi panti asuhan',
      'image': 'assets/beach.jpg',
    },
  ];

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
              // Tombol Back di atas
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 12),

              // Search Bar
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

              // List Quest
              Expanded(
                child: ListView.builder(
                  itemCount: filteredQuests.length,
                  itemBuilder: (context, index) {
                    final quest = filteredQuests[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BigQuestDetailPage()),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    quest['image']!,
                                    width: double.infinity,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 160,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    quest['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    quest['description']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
