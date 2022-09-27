import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PoapImage extends StatelessWidget {
  const PoapImage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    this.width,
  });

  final String imageUrl;
  final String heroTag;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: CachedNetworkImage(imageUrl: imageUrl, width: width),
    );
  }
}
