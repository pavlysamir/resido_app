import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/features/search/data/models/category_item_model.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';

class CustomItemProbirty extends StatelessWidget {
  const CustomItemProbirty({
    super.key,
    required this.dataItem,
  });
  final DataItem dataItem;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            SearchCubit.get(context)!.selectCategory(dataItem.id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 90.w,
              decoration: BoxDecoration(
                color: SearchCubit.get(context)!
                            .selectedMapCategory[dataItem.id] ==
                        true
                    ? AppColors.primaryColor
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.white,
                        child: CachedNetworkImage(imageUrl: dataItem.image)),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      dataItem.name,
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
