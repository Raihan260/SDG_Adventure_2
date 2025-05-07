import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.base,
      body: Center(
        child: Text('Halaman Search'),
      ),
    );
  }
}
