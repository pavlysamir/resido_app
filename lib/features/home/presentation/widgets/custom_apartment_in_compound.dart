import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/data/models/compound_details_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/core/utils/app_colors.dart';

class CustomApartmentInCompound extends StatelessWidget {
  const CustomApartmentInCompound({
    super.key,
    required this.apartment,
  });
  final Apartment apartment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return PropertyDetailes(
          //     featureProperty: featureProperty,
          //   );
          // }));
        },
        child: Card(
            clipBehavior: Clip.none,
            shadowColor: AppColors.grey,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: AppColors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: apartment.image,
                    height: 88.h,
                    width: 200.w,
                    placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                          width: 220.w,
                          height: 184.h,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Text(
                  'start from',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
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
                      apartment.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
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
                      apartment.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
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
                      apartment.address ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    //const Spacer(),
                    SizedBox(
                      width: 20.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        apartment.priceTo ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
