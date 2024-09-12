import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../favourite/data/models/favorite_model.dart';
import '../../../home/presentation/managers/home_cubit/home_cubit.dart';
import '../../../home/presentation/widgets/grid_view_properties.dart';
import '../../../home/presentation/widgets/grid_view_properties_item.dart';
import '../../logic/cubit/category_filter_cubit.dart';

class CategoryFilterScreen extends StatelessWidget {
  final dynamic modelOfCategoryFilter;
  const CategoryFilterScreen({super.key, this.modelOfCategoryFilter});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    // cubit?.getMostLike();

    return Scaffold(
      appBar: CustomAppBar(
        title: modelOfCategoryFilter.name,
        showBackButton: true,
        function: () {

          Navigator.of(context).pop();
        },
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const GridViewMostLikedProperties(),
            ],
          ),
        ),
      ),
    );
  }
}
