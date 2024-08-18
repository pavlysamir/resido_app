import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/search/presentation/widgets/custom_item_proberty.dart';

class CustomPropertyListview extends StatelessWidget {
  const CustomPropertyListview({super.key});

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
            return const CustomItemProbirty();
          }),
    );
  }
}
