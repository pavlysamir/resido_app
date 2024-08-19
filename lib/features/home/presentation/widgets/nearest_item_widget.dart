import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class NearestWidget extends StatelessWidget {
  const NearestWidget({
    super.key,
  });

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
                color: AppColors.black,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.home_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          const Text(
            'House',
            style: TextStyle(
                color: AppColors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 70.w,
          ),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.home_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          const Text(
            'House',
            style: TextStyle(
                color: AppColors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
