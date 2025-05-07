import 'package:flutter/material.dart';
import 'big_quest_detail_page.dart'; // import halaman detail

class BigQuestPage extends StatelessWidget {
  const BigQuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bigQuests = [
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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Big Quest",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bigQuests.length,
        itemBuilder: (context, index) {
          final quest = bigQuests[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BigQuestDetailPage()),
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
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      quest['image']!,
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
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
    );
  }
}
