import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_item_proberty.dart';

class CustomPropertyHomeListview extends StatelessWidget {
  const CustomPropertyHomeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: HomeCubit.get(context)!.categoryItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomItemProbirtyHome(
                  category: HomeCubit.get(context)!.categoryItems[index],
                );
              }),
        );
      },
    );
  }
}
