import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/features/home/data/models/compound_model.dart';

class CustomItemCompound extends StatelessWidget {
  const CustomItemCompound({
    super.key,
    required this.compoundModel,
    // required this.featureProperty,
  });
  final CompoundModel compoundModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // customJustGoNavigate(
        //     context: context, path: AppRouter.kPropertyDetails);

        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return PropertyDetailes(
        //     featureProperty: featureProperty,
        //   );
        // }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomRight, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    // 'https://www.shutterstock.com/image-photo/residential-area-ecological-sustainable-green-600nw-1888460134.jpg',
                    compoundModel.image,
                height: 200.h,
                width: 300.w,

                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 300.w,
                    height: 200.h,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
                top: 10, // Position it at the bottom
                left: 0, // Position it at the left
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white.withOpacity(0.5)),
                    child: Center(
                        child: Text(
                      'sell',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                )),
            Positioned(
              bottom: 10.h,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.business,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        compoundModel.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        compoundModel.address ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(compoundModel.priceMax,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
