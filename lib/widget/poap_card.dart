import 'package:defiant/models/poap.dart';
import 'package:defiant/screens/details_screen.dart';
import 'package:defiant/widget/poap_image.dart';
import 'package:flutter/material.dart';
import 'primary_button.dart';

class PoapCard extends StatelessWidget {
  const PoapCard({super.key, required this.poap});

  final Poap poap;

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
              child: PoapImage(
                heroTag: poap.tokenId,
                imageUrl: poap.imageUrl,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  poap.name,
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
                      builder: (_) => DetailsScreen(poap: poap),
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
