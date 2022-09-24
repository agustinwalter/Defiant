import 'package:flutter/material.dart';
import '../screens/details_screen.dart';
import 'primary_button.dart';

class PoapCard extends StatelessWidget {
  const PoapCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Hero(
                tag: '$index',
                child: Image.network(
                  'https://assets.poap.xyz/adrian-sobol-2022-logo-1660921558255.png',
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Nec Mergitur Edition #33 ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: PrimaryButton(
                text: 'POAP',
                small: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsScreen(index: index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
