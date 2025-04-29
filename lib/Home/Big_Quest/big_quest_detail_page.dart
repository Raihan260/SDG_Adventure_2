import 'package:flutter/material.dart';

class BigQuestDetailPage extends StatelessWidget {
  const BigQuestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Tombol kembali ke HomePage
          },
        ),
      ),
      body: const Center(
        child: Text('Halaman Detail Page.', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
