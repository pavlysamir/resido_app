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
        var cubit = HomeCubit.get(context);
        return SizedBox(
          height: 176.h,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.w,
                );
              },
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: cubit!.copoundList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomItemCompound(
                  compoundModel: cubit.copoundList[index],
                );
              }),
        );
      },
    );
  }
}
