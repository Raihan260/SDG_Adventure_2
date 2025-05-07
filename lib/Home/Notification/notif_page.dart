import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        title: const Text(
          'Notifications',
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
        child: Text('Belum ada notifikasi baru.', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
