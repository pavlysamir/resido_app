import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';

class CustomItemProbirtyHome extends StatelessWidget {
  const CustomItemProbirtyHome({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 90.w,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context)
                  .inputDecorationTheme
                  .enabledBorder!
                  .borderSide
                  .color),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColors.white,
                child: CachedNetworkImage(
                  imageUrl: category.image,
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: Text(
                  category.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
