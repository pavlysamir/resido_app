import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';

import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/presentation/views/property_details_screen.dart';

class CustomprobFeaturedItem extends StatelessWidget {
  const CustomprobFeaturedItem({
    super.key,
    required this.featureProperty,
  });
  final FeatureProperty featureProperty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // customJustGoNavigate(
        //     context: context, path: AppRouter.kPropertyDetails);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PropertyDetailes(
            featureProperty: featureProperty,
          );
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomRight, children: [
            CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: featureProperty.image,
                height: 150.h,
                width: 250.w),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  child: const Icon(
                    Icons.favorite_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            CustomSellContainer(
              text: featureProperty.type.title,
            ),
          ]),
          Container(
            width: 250.w,
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
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        featureProperty.sub.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Text(
                    featureProperty.price,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text(featureProperty.title ?? '',
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
                          featureProperty.address ?? '',
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
