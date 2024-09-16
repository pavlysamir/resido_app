import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBannerHome extends StatelessWidget {
  const CustomBannerHome({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 10.0,
              color: Colors.black12,
            ),
          ]),
      child: CachedNetworkImage(
        width: double.infinity,
        fit: BoxFit.fitHeight,
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
