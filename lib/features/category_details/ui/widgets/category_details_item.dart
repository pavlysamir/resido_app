import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';
import 'package:resido_app/features/category_details/logic/cubit/category_details_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import '../../../../core/utils/widgets/custom_botton_sheet_guest.dart';
import '../../../category_details/data/models/category_details_model.dart';

class CategoryDetailsItem extends StatelessWidget {
  final CategoryDetails item;

  const CategoryDetailsItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CategoryDetailsCubit.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.topRight, children: [
          if (item.image != null )
            CachedNetworkImage(
              imageUrl: item.image ?? '',
              width: 215.w,
              height: 150.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 215.w,
                  height: 215.h,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),

            ),
          GestureDetector(
            onTap: () {
           //   cubit?.addPropertyToFavorites(item.id ?? 0);
              if(token == null){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const CustomBottomSheetGuest();
                  },
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final isFavorite = cubit?.isFavorites[item.id] ?? false;
                    return Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: AppColors.primaryColor,
                    );
                  },
                ),
              ),
            ),
          ),
          // CustomSellContainer(
          //   text: item.type.title,
          // ),
        ]),
        Container(
          width: 215.w,
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // const Icon(
                    //   Icons.business,
                    //   size: 18,
                    // ),
                    Text(
                      item.name.toString() ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add_business_sharp,
                      size: 18.h,
                      color:AppColors.primaryColor ,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        item.name.toString()??'',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.business_sharp,
                      size: 18.h,
                      color: AppColors.primaryColor,
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(item.name.toString() ??'',
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      size: 18,
                      color: AppColors.primaryColor,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        item.address.toString() ?? '',
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