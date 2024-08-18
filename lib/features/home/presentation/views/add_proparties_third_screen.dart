import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/core/utils/widgets/custom_button_large.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/widgets/custom_description_post_field.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/features/home/presentation/managers/cubit/add_proparties_cubit.dart';

class AddPropertiesThirdScreen extends StatelessWidget {
  const AddPropertiesThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Properties',
        function: () {
          Navigator.of(context).pop();
        },
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('3/3', style: Theme.of(context).textTheme.titleSmall),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButtonLarge(
          text: AppLocalizations.of(context)!.next,
          function: () {
            // customJustGoNavigate(
            //     context: context, path: AppRouter.kAddSecondProperties);
          },
          textColor: AppColors.white,
        ),
      ),
      body: BlocBuilder<AddPropartiesCubit, AddPropartiesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Image.asset(
                        AssetsData.icon_1,
                        height: 32.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        AppLocalizations.of(context)!.addValues,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 15.w);
                        },
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              AddPropartiesCubit.get(context)!
                                  .selectValue(index: index);
                            },
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: AddPropartiesCubit.get(context)!
                                                .selecties['selected'] ==
                                            true &&
                                        AddPropartiesCubit.get(context)!
                                                .selecties['index'] ==
                                            index
                                    ? AppColors.primaryColor
                                    : AppColors.white,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Center(child: Text('${index + 1}')),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    AppLocalizations.of(context)!.description,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 14.h),
                  CustomDescriptionPostField(
                      height: 130.h,
                      controller: AddPropartiesCubit.get(context)!
                          .propertyDescriptionController,
                      hintText: 'Write something here...',
                      textInputType: TextInputType.text),
                  SizedBox(height: 14.h),
                  Text(
                    AppLocalizations.of(context)!.address,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 14.h),
                  CustomFormField(
                    controller:
                        AddPropartiesCubit.get(context)!.addressCityController,
                    hintText: 'City',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 14.h),
                  CustomFormField(
                    controller:
                        AddPropartiesCubit.get(context)!.addressStateController,
                    hintText: 'State',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 14.h),
                  CustomFormField(
                    controller: AddPropartiesCubit.get(context)!
                        .addressCountryController,
                    hintText: 'Country',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 14.h),
                  CustomDescriptionPostField(
                      height: 100.h,
                      controller: AddPropartiesCubit.get(context)!
                          .clientAddressController,
                      hintText: 'Address',
                      textInputType: TextInputType.text),
                  SizedBox(height: 14.h),
                  Text(
                    AppLocalizations.of(context)!.chooseYourAddress,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 14.h),
                  CustomDescriptionPostField(
                      height: 100.h,
                      controller: AddPropartiesCubit.get(context)!
                          .propertyDescriptionController,
                      hintText: 'Client Address',
                      textInputType: TextInputType.text),
                  SizedBox(height: 14.h),
                  Text(
                    AppLocalizations.of(context)!.price,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 14.h),
                  CustomFormField(
                    controller:
                        AddPropartiesCubit.get(context)!.priceController,
                    hintText: 'price',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
