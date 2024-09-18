import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_item_proberty.dart';
import 'package:shimmer/shimmer.dart';

class CustomPropertyHomeListview extends StatelessWidget {
  const CustomPropertyHomeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (cubit!.categoryItems == [] || cubit.categoryItems.isEmpty) {
          return SizedBox(
            height: 50.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Number of shimmer items
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 100.w,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    color: Colors.white,
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: 50.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cubit.categoryItems.length,
              itemBuilder: (context, index) {
                return CustomItemProbirtyHome(
                  category: cubit.categoryItems[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
