import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class BackgroundEditPage extends StatelessWidget {
  const BackgroundEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.mainBlack),
        title: const Text(
          'Edit Background',
          style: TextStyle(
            fontFamily: 'Montserrat_SemiBold',
            fontSize: 18,
            color: AppColor.mainBlack,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Halaman untuk mengedit background.',
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
