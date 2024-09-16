import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_colors.dart';
import 'custom_button_large.dart';

class CustomBottomSheetGuest extends StatelessWidget {
  const CustomBottomSheetGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Register Is Required',
                  style: TextStyle(fontSize: 16, color: AppColors.darkGrey),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: CustomButtonLarge(
              text: AppLocalizations.of(context)!.registerNow,
              function: () {
                //  SearchCubit.get(context)!.filter(1);
                // customJustGoNavigate(
                //     context: context, path: AppRouter.KCategoryFilterScreen);
              },
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
