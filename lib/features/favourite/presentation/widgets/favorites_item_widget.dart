import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';
import '../../../../core/utils/app_colors.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 350.h,
                width: 170.w,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(AssetsData.unitItem),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                bottom: 0, // Position it at the bottom
                left: 0, // Position it at the left
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Colors.white.withOpacity(0.5)),
                    child: Center(
                        child: Text(
                      'Sell',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 200.w,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3.r),
                  bottomRight: Radius.circular(3.r)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.business,
                        size: 18,
                      ),
                      Text(
                        'city',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).cardColor,
                        child: const Icon(
                          Icons.favorite_outline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '2,500,000',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text('Luxuries Haven Villa',
                      style: Theme.of(context).textTheme.labelMedium),
                  const Spacer(),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 18,
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Text(
                          '123 Palm Avenue, Dubai, United Arab',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
