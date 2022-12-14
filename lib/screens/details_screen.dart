import 'package:defiant/models/poap.dart';
import 'package:defiant/widget/poap_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.poap});

  final Poap poap;

  @override
  Widget build(BuildContext context) {
    final cardMinHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight -
        135;

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 135),
                padding: const EdgeInsets.fromLTRB(24, 155, 24, 24),
                constraints: BoxConstraints(
                  minHeight: cardMinHeight,
                  minWidth: double.infinity,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poap.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Text(poap.description),
                    const SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Created at: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: poap.createdAt),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Network: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: poap.chain),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Center(
                  child: PoapImage(
                    heroTag: poap.tokenId,
                    imageUrl: poap.imageUrl,
                    width: 270,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
