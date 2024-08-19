import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';

class CustomItemProbirty extends StatelessWidget {
  const CustomItemProbirty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 90.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home_outlined,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                'House',
                style: Theme.of(context).textTheme.bodySmall!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
