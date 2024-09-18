import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/category_details_cubit.dart';
import 'item_property.dart';

class CategoryFilterListview extends StatelessWidget {
  const CategoryFilterListview({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryDetailsCubit>().getSubCategory();

    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoryDetailsCubit.get(context);
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: cubit?.subCategoryItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ItemProperty(
                  dataItem: cubit!.subCategoryItems[index],
                );
              }),
        );
      },
    );
  }
}
