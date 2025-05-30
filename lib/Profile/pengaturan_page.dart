import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            fontFamily: 'Montserrat_SemiBold',
            fontSize: 18,
            color: AppColor.mainBlack,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.mainBlack),
      ),
      body: const Center(
        child: Text(
          'Ini adalah halaman pengaturan.',
          style: TextStyle(
            fontFamily: 'Montserrat_Regular',
            fontSize: 16,
            color: AppColor.mainBlack,
          ),
        ),
      ),
    );
  }
}
