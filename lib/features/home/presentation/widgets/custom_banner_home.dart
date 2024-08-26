import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBannerHome extends StatelessWidget {
  const CustomBannerHome({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(width: double.infinity, imageUrl: imageUrl);
  }
}
