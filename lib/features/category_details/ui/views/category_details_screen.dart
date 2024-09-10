import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';

import '../../../../core/widgets/header_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final int idOFCategory;
  const CategoryDetailsScreen({super.key, required this.idOFCategory});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);

    return Scaffold(

      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final mostLikeList = cubit!.mostLike!.data;
          return mostLikeList.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWidget(
                        title: 'Category Details',
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 1.0,
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
