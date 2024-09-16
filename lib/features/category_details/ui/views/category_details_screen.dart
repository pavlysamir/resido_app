import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/core/widgets/once_future_builder.dart';
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

class CategoryDetailsScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailsScreen({super.key, required this.category});


  @override
  Widget build(BuildContext context) {
    var cubit = CategoryDetailsCubit.get(context);
 cubit?.getCategoryDetails(category.id,1);

    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoryDetailsLoading &&
            cubit!.dataCategoryDetailsModel == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CategoryDetailsError &&
            cubit!.dataCategoryDetailsModel == null) {
          return Scaffold(
            body: Center(
              child: Text("no data",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          );
        } else {
          final categoryDetails = cubit?.dataCategoryDetailsModel;

          return OnceFutureBuilder(
            future: () => cubit!.getCategoryDetails(category.id, 1),
            builder: (context,snapShout){
              return  Scaffold(
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
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.close, color: AppColors.primaryColor),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                    const ContainerSwitcher(),
                                    SizedBox(height: 20.h),
                                    Text(
                                      AppLocalizations.of(context)!.typeOfProperty,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    SizedBox(height: 20.h),
                                    const CategoryFilterListview(),
                                    SizedBox(height: 20.h),
                                    Text(
                                      AppLocalizations.of(context)!.budget,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        buildCustomFormField(
                                            context,
                                            CategoryDetailsCubit.get(context)!.filterMinBudgetController,
                                            'Min'),
                                        SizedBox(width: 14.w),
                                        buildCustomFormField(
                                            context,
                                            CategoryDetailsCubit.get(context)!.filterMinToBudgetController,
                                            'Max'),
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
                                        buildCustomFormField(
                                            context,
                                            CategoryDetailsCubit.get(context)!.filterAreaToController,
                                            'to'),
                                        SizedBox(width: 14.w),
                                        buildCustomFormField(
                                            context,
                                            CategoryDetailsCubit.get(context)!.filterAreaFromController,
                                            'from'),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
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
                                            controller: CategoryDetailsCubit.get(context)!.location,
                                            hintText: AppLocalizations.of(context)!.selectLocation,
                                            textInputType: TextInputType.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 12.h),
                                      child: CustomButtonLarge(
                                        text: AppLocalizations.of(context)!.applyFilter,
                                        function: () {
                                          customJustGoNavigate(
                                            context: context,
                                            path: AppRouter.KCategoryFilterScreen,
                                            data: CategoryDetailsCubit.get(context)!.getControllerValues(
                                              id: category.id.toString(),
                                              name: category.name,
                                            ),
                                          );
                                        },
                                        textColor: Colors.white,
                                      ),
                                    ),
                                  ],
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
                        itemCount: categoryDetails?.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryDetailsItem(item: categoryDetails!.data[index]);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget buildCustomFormField(
      BuildContext context, TextEditingController controller, String hintText) {
    return Expanded(
      child: CustomFormField(
        controller: controller,
        hintText: hintText,
        textInputType: TextInputType.number,
      ),
    );
  }
}
