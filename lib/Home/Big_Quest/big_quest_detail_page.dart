import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';


class BigQuestDetailPage extends StatelessWidget {
  const BigQuestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
