import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_item_compound.dart';

import '../../../../core/utils/app_colors.dart';

class CompoundScreen extends StatelessWidget {
  const CompoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.compounds,
        function: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = HomeCubit.get(context);

              return Column(
                children: [
                  ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 14.h,
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit!.copoundList.length,
                      itemBuilder: (context, index) {
                        return CustomItemCompound(
                          compoundModel: cubit.copoundList[index],
                        );
                      })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
