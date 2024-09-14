import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';

class CustomItemProbirtyHome extends StatelessWidget {
  const CustomItemProbirtyHome({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customJustGoNavigate(
            context: context,
            path: AppRouter.kCateegoryDeatilsScreen,
            data: category);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0,
                  color: Colors.black12,
                ),
              ] // changes position of shadow
              ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (category.image != null && category.image!.isNotEmpty)
                    CachedNetworkImage(
                      imageUrl: category.image!,
                      height: 25.h,
                      width: 25.w,
                      fit: BoxFit.cover,
                    ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        category.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
