import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSellContainer extends StatelessWidget {
  const CustomSellContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0, // Position it at the bottom
        left: 0, // Position it at the left
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white.withOpacity(0.5)),
            child: Center(
                child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            )),
          ),
        ));
  }
}
