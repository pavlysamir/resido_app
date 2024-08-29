import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/data/models/expanded_icons_text_model.dart';

import '../../../../core/utils/app_colors.dart';

class NearestWidget extends StatelessWidget {
  const NearestWidget({
    super.key,
    required this.iconOne,
    required this.iconTwo,
    required this.num1,
    required this.num2,
    required this.name1,
    required this.name2,
  });

  final IconData iconOne;
  final IconData iconTwo;

  final String num1;
  final String num2;

  final String name1;
  final String name2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              iconOne,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                num1.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(
            width: 70.w,
          ),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              iconTwo,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name2,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                num2.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomGridViewAdditionApartment extends StatelessWidget {
  const CustomGridViewAdditionApartment({super.key, required this.list});

  final List<ExpandedIconsWithTextModel> list;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3, // Adjust this to control width/height ratio

          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Row(children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                list[index].iconOne,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  list[index].name!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  list[index].num!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ]);
        });
  }
}
