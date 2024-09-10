import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/header_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final int idOFCategory;
  const CategoryDetailsScreen({super.key, required this.idOFCategory});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'i want response',
        showBackButton: true,
        function: () {
          Navigator.of(context).pop();
        },
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: AppColors.primaryColor),
            onPressed: () {
              // Add your filter action here
            },
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final mostLikeList = cubit!.mostLike!.data;
          return mostLikeList.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w),
                        gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3.w /4.3.h,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 2.0,
                        ),
                        itemCount:
                            mostLikeList.length, // dynamically set itemCount
                        itemBuilder: (BuildContext context, int index) {
                          return GridViewPropertiesItem(
                              item: mostLikeList[index]);
                        },
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text('No items found')); // handle empty state
        },
      ),
    );
  }
}
