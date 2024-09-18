// lib/features/favourite/ui/widgets/favorites_item_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/favourite/logic/cubit/favorite_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/favorite_model.dart';

class FavoriteItem extends StatelessWidget {
  final Data favoriteData;

  const FavoriteItem({
    super.key, required this.favoriteData,});

  @override
  Widget build(BuildContext context) {
    final cubit = FavoriteCubit.get(context);
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 350.h,
                width: 170.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(favoriteData.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
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
                          favoriteData.type.title.toString(),
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
              color: Theme.of(context).appBarTheme.backgroundColor,
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
                        favoriteData.title ?? '',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap:() {
                          cubit?.removeItemFromFavorites(favoriteData.id);
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).cardColor,
                          child: BlocBuilder<FavoriteCubit, FavoriteState>(
                            builder: (context, state) {
                              final isFavorite = cubit?.isFavorites[
                              favoriteData.id
                              ] ?? false;
                              return const Icon(
                                Icons.favorite,
                                color: AppColors.primaryColor,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    favoriteData.price,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    favoriteData.description ?? '',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
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
                          favoriteData.address ?? '',
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

