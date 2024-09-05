import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/widgets/custom_button_large.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/features/search/presentation/widgets/custom_property_listView.dart';
import 'package:resido_app/features/search/presentation/widgets/switcher_container.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is FilterSuccess) {
          customJustGoNavigate(
              context: context, path: AppRouter.kFilterResultsScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context)!.filter,
              function: () {
                Navigator.pop(context);
              },
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButtonLarge(
                text: AppLocalizations.of(context)!.applyFilter,
                function: () {
                  SearchCubit.get(context)!.filter(1);
                },
                textColor: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const ContainerSwitcher(),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.typeOfProperty,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 20.h),
                    const CustomPropertyListview(),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.budget,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                              controller: SearchCubit.get(context)!
                                  .filterMinBudgetController,
                              hintText: 'Min',
                              textInputType: TextInputType.number),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: CustomFormField(
                              controller: SearchCubit.get(context)!
                                  .filterMinToBudgetController,
                              hintText: 'Max',
                              textInputType: TextInputType.number),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.area,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                              controller: SearchCubit.get(context)!
                                  .filterAreaToController,
                              hintText: 'to',
                              textInputType: TextInputType.number),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: CustomFormField(
                              controller: SearchCubit.get(context)!
                                  .filterAreafromController,
                              hintText: 'from',
                              textInputType: TextInputType.number),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    // Text(
                    //   AppLocalizations.of(context)!.postedSince,
                    //   style: Theme.of(context).textTheme.headlineSmall,
                    // ),
                    // SizedBox(height: 20.h),
                    // const CustomPstedTimeListview(),
                    //SizedBox(height: 20.h),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: CustomFormField(
                              controller: SearchCubit.get(context)!.location,
                              hintText:
                                  AppLocalizations.of(context)!.selectLocation,
                              textInputType: TextInputType.number),
                        ),
                        // SizedBox(width: 14.w),
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     height: 50.h,
                        //     width: 40.w,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(color: Colors.grey[300]!),
                        //       color: Theme.of(context).cardColor,
                        //     ),
                        //     child: const Icon(
                        //       Icons.location_searching_outlined,
                        //       color: AppColors.primaryColor,
                        //       size: 30.0,
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
