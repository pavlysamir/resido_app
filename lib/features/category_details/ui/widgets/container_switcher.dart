import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/app_colors.dart';
import '../../logic/cubit/category_details_cubit.dart';

class ContainerSwitcher extends StatelessWidget {
  const ContainerSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => CategoryDetailsCubit.get(context)!.toggleCategory(1),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: CategoryDetailsCubit.get(context)!.toggleMapType[1] == true
                          ? AppColors.primaryColor
                          : const Color.fromARGB(255, 215, 227, 215),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.sell,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: CategoryDetailsCubit.get(context)!.toggleMapType[1] == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => CategoryDetailsCubit.get(context)!.toggleCategory(2),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: CategoryDetailsCubit.get(context)!.toggleMapType[2] == true
                          ? AppColors.primaryColor
                          : const Color.fromARGB(255, 215, 227, 215),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.rent,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: CategoryDetailsCubit.get(context)!.toggleMapType[2] == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}