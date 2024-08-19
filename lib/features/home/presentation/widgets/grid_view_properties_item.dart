import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';

class GridViewPropertiesItem extends StatelessWidget {
  const GridViewPropertiesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          Image.asset(
            AssetsData.unitItem,
            width: 250.w,
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            child: const Icon(
              Icons.favorite_outline,
              color: AppColors.primaryColor,
            ),
          ),
          const CustomSellContainer(
            text: 'Sell',
          ),
        ]),
        Container(
          width: 250.w,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(5.r),
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
    );
  }
}
