import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';

class CustomBannerHome extends StatelessWidget {
  const CustomBannerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsData.banner)),
      ),
    );
  }
}
