import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_item_compound.dart';

class CustomListviewCompound extends StatelessWidget {
  const CustomListviewCompound({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 200.h,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: HomeCubit.get(context)!.copoundList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomItemCompound(
                  compoundModel: HomeCubit.get(context)!.copoundList[index],
                );
              }),
        );
      },
    );
  }
}
