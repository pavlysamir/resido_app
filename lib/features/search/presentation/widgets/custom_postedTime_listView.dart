import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/search/presentation/widgets/custom_postedTime_item.dart';

class CustomPstedTimeListview extends StatelessWidget {
  const CustomPstedTimeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomItemPostedTime();
          }),
    );
  }
}
