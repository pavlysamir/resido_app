import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/features/search/presentation/widgets/custom_item_proberty.dart';

class CustomPropertyListview extends StatelessWidget {
  const CustomPropertyListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: SearchCubit.get(context)!.categoryItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomItemProbirty(
                  dataItem: SearchCubit.get(context)!.categoryItems[index],
                );
              }),
        );
      },
    );
  }
}
