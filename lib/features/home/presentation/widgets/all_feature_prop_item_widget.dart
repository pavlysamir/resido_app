import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import '../../../../core/utils/app_colors.dart';

class AllFeaturePropItemWidget extends StatelessWidget {
  const AllFeaturePropItemWidget({
    super.key,
    required this.featureProperty,
  });

  final FeatureProperty featureProperty;
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
              CachedNetworkImage(
                  imageUrl: featureProperty.image ?? '',
                  height: 350.h,
                  width: 170.w,
                  fit: BoxFit.cover),
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
                      featureProperty.type?.name ?? '',
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
                        featureProperty.sub?.name ?? '',
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
                    featureProperty.priceTo ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text(featureProperty.priceTo ?? '',
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
