import 'package:defiant/widget/poap_card.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Your NFTs',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(22),
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: .66,
          children: List.generate(10, (index) => PoapCard(index: index)),
        ),
      ),
    );
  }
}
