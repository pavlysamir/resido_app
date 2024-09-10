import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import '../../data/models/most_like_model.dart';

class GridViewPropertiesItem extends StatelessWidget {
  final Data item;

  const GridViewPropertiesItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          CachedNetworkImage(
            imageUrl: item.image,
            width: 215.w,
            height: 100.h,
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
              cubit?.addPropertyToFavorites(item.id);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
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
          CustomSellContainer(
            text: item.type.title,
          ),
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
                    const Icon(
                      Icons.business,
                      size: 18,
                    ),
                    Text(
                      item.sub.name.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                Text(
                  item.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(item.title.toString(),
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
                        item.address.toString(),
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
