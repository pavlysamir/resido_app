import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/presentation/views/property_details_screen.dart';

import '../managers/home_cubit/home_cubit.dart';

class CustomprobFeaturedItem extends StatelessWidget {
  const CustomprobFeaturedItem({
    super.key,
    required this.featureProperty,
  });
  final FeatureProperty featureProperty;

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PropertyDetailes(
              featureProperty: featureProperty,
            );
          }));
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
                    imageUrl: featureProperty.image,
                    height: 88.h,
                    width: 260.w,
                    placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SizedBox(
                          width: 300.w,
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
                      featureProperty.title ?? '',
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
                      featureProperty.sub.name ?? '',
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
                      featureProperty.address ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    //const Spacer(),
                    SizedBox(
                      width: 120.w,
                    ),
                    Text(
                      'dddddd',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ])));
  }
}








// Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(alignment: Alignment.bottomRight, children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: CachedNetworkImage(
//                 fit: BoxFit.cover,
//                 imageUrl: featureProperty.image,
//                 height: 160.h,
//                 width: 260.w,
//                 placeholder: (context, url) => Shimmer.fromColors(
//                   baseColor: Colors.grey[300]!,
//                   highlightColor: Colors.grey[100]!,
//                   child: Container(
//                     width: 250.w,
//                     height: 160.h,
//                     color: Colors.white,
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   cubit?.addPropertyToFavorites(featureProperty.id);
//                 },
//                 child: CircleAvatar(
//                   backgroundColor: Theme.of(context).cardColor,
//                   child: BlocBuilder<HomeCubit, HomeState>(
//                     builder: (context, state) {
//                       final isFavorite =
//                           cubit?.isFavorites[featureProperty.id] ?? false;
//                       return Icon(
//                         isFavorite ? Icons.favorite : Icons.favorite_outline,
//                         color: AppColors.primaryColor,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             CustomSellContainer(
//               text: featureProperty.type.title,
//             ),
//           ]),
//           Container(
//             width: 260.w,
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(3.r),
//                 bottomRight: Radius.circular(3.r),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.business,
//                         size: 18,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Expanded(
//                         child: Text(
//                           featureProperty.sub.name,
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     featureProperty.price,
//                     style: Theme.of(context)
//                         .textTheme
//                         .labelLarge!
//                         .copyWith(color: AppColors.primaryColor),
//                   ),
//                   Text(
//                     featureProperty.title ?? '',
//                     style: Theme.of(context).textTheme.labelMedium,
//                   ),
//                   Row(
//                     children: [
//                       const Expanded(
//                         flex: 1,
//                         child: Icon(
//                           Icons.location_on_outlined,
//                           size: 18,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 9,
//                         child: Text(
//                           featureProperty.address ?? '',
//                           style: Theme.of(context).textTheme.bodyMedium,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),