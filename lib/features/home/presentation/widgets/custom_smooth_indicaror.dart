import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator(
      {super.key, required this.activeIndex, required this.count});

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: const JumpingDotEffect(
          dotColor: Colors.grey,
          activeDotColor: AppColors.primaryColor,
          dotHeight: 6,
          dotWidth: 6),
    );
  }
}
