import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';

import '../../logic/cubit/category_filter_cubit.dart';
import 'grid_view_filter_item.dart';

class GridViewCategoryFilter extends StatelessWidget {
  final Map<String, String> listFilter;
  const GridViewCategoryFilter({super.key, required this.listFilter});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryFilterCubit, CategoryFilterState>(
      listener: (context, state) {
        // Handle side effects here if needed
      },
      builder: (context, state) {
        final cubit = CategoryFilterCubit.get(context);

        if (state is CategoryFilterLoading) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 5, // Default shimmer items count
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
          );
        } else if (cubit!.categoryFilterModel == null || cubit.categoryFilterModel!.data.isEmpty) {
          return Center(
            child: Text(
              'No data available',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          final mostLikeList = cubit.categoryFilterModel!.data;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.w / 4.5.h,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 2.0.h,
            ),
            itemCount: mostLikeList.length,
            itemBuilder: (BuildContext context, int index) {
              return GridViewFilterITem(item: mostLikeList[index]);
            },
          );
        }
      },
    );
  }
}