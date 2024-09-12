import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/features/category_details/ui/widgets/container_switcher.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/widgets/custom_button_large.dart';
import '../../../../core/utils/widgets/custom_form_field.dart';
import '../../../../core/utils/widgets/custom_go_navigator.dart';
import '../../../../core/widgets/header_widget.dart';
import '../../../home/data/models/category_item_model.dart';
import '../../../search/presentation/managers/cubit/search_cubit.dart';
import '../../../search/presentation/widgets/custom_property_listView.dart';
import '../../logic/cubit/category_details_cubit.dart';
import '../widgets/category_details_item.dart';
import '../widgets/property_list_view.dart';

/// ya gamal a9ml icon padding of grid view properties item
class CategoryDetailsScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Call the getCategoryDetails function when the widget is initialized
    context.read<CategoryDetailsCubit>().getCategoryDetails(category.id);

    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {
        // Handle any additional state changes if needed
      },
      builder: (context, state) {
        if (state is CategoryDetailsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CategoryDetailsError) {
          return Scaffold(
            body: Center(
              child: Text("no data",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          );
        } else {
          final categoryDetails =
              CategoryDetailsCubit.get(context)!.dataCategoryDetailsModel;

          return Scaffold(
            appBar: CustomAppBar(
              title: category.name,
              showBackButton: true,
              function: () {
                Navigator.of(context).pop();
              },
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list,
                      color: AppColors.primaryColor),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  //  bottom: MediaQuery.of(context).viewInsets.bottom,
                                  ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: IconButton(
                                          icon: const Icon(Icons.close,
                                              color: AppColors.primaryColor),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //SizedBox(height: 20.h),
                                        const ContainerSwitcher(),
                                        SizedBox(height: 20.h),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .typeOfProperty,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        SizedBox(height: 20.h),
                                        const CategoryFilterListview(),
                                        SizedBox(height: 20.h),
                                        Text(
                                          AppLocalizations.of(context)!.budget,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomFormField(
                                                controller: CategoryDetailsCubit
                                                        .get(context)!
                                                    .filterMinBudgetController,
                                                hintText: 'Min',
                                                textInputType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            SizedBox(width: 14.w),
                                            Expanded(
                                              child: CustomFormField(
                                                controller: CategoryDetailsCubit
                                                        .get(context)!
                                                    .filterMinToBudgetController,
                                                hintText: 'Max',
                                                textInputType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          AppLocalizations.of(context)!.area,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomFormField(
                                                controller:
                                                    CategoryDetailsCubit.get(
                                                            context)!
                                                        .filterAreaToController,
                                                hintText: 'to',
                                                textInputType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            SizedBox(width: 14.w),
                                            Expanded(
                                              child: CustomFormField(
                                                controller: CategoryDetailsCubit
                                                        .get(context)!
                                                    .filterAreaFromController,
                                                hintText: 'from',
                                                textInputType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: CustomFormField(
                                                controller:
                                                    CategoryDetailsCubit.get(
                                                            context)!
                                                        .location,
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .selectLocation,
                                                textInputType:
                                                    TextInputType.text,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.h),
                                          child: CustomButtonLarge(
                                            text: AppLocalizations.of(context)!
                                                .applyFilter,
                                            function: () {
                                              SearchCubit.get(context)!
                                                  .filter(1);
                                              customJustGoNavigate(
                                                  context: context,
                                                  path: AppRouter
                                                      .KCategoryFilterScreen,
                                                  data: category
                                              );
                                              // print in log the values of the filters
                                            },
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.w / 4.3.h,
                      crossAxisSpacing: 10.h,
                      mainAxisSpacing: 2.w,
                    ),
                    itemCount: categoryDetails
                        ?.data.length, // dynamically set itemCount
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryDetailsItem(
                          item: categoryDetails!.data[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
