import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/widgets/custom_button_large.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties.dart';

class AddPropertiesScreen extends StatelessWidget {
  const AddPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.addProperties,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('1/3', style: Theme.of(context).textTheme.titleSmall),
          )
        ],
        function: () {
          selecties.clear();
          Navigator.of(context).pop();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButtonLarge(
          text: AppLocalizations.of(context)!.next,
          function: () {
            customJustGoNavigate(
                context: context, path: AppRouter.kAddSecondProperties);
          },
          textColor: AppColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              Text(
                AppLocalizations.of(context)!.typeOfProperty,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 14.h),
              const GridViewMostLikedProperties()
            ],
          ),
        ),
      ),
    );
  }
}
