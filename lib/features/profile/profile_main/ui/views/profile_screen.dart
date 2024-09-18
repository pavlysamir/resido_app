import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:resido_app/core/utils/widgets/sub_custom_app_bar.dart';
import 'package:resido_app/features/profile/profile_main/logic/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubCustomAppBar(
        title: AppLocalizations.of(context)!.myProfile,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                customJustGoNavigate(
                    context: context, path: AppRouter.kProfileEditScreen);
              },
              leading: const Icon(Icons.person, color: AppColors.primaryColor),
              title: Text(
                AppLocalizations.of(context)!.myProfile,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PopUpDialog(
                    function2: () {
                      Navigator.pop(context);
                    },
                    context: context,
                    function: () {
                      ProfileCubit.get(context).changeLanguage();
                      Navigator.pop(context);
                    },
                    title: AppLocalizations.of(context)!.confirmChangeLng,
                    subTitle: AppLocalizations.of(context)!.doChangeLanguage,
                    colorButton1: Colors.white,
                    colorButton2: AppColors.primaryColor,
                    textColortcolor1: AppColors.primaryColor,
                    textColortcolor2: Colors.white,
                  ),
                );
              },
              leading:
                  const Icon(Icons.language, color: AppColors.primaryColor),
              title: Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.star, color: AppColors.primaryColor),
              title: Text(
                AppLocalizations.of(context)!.rateUs,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            ),
            ListTile(
                onTap: () {},
                leading:
                    const Icon(Icons.dark_mode, color: AppColors.primaryColor),
                title: Text(
                  AppLocalizations.of(context)!.darkTheme,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    Logger().i('value: $value');
                    context.read<ProfileCubit>().setThemeMode();
                  },
                )),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.share, color: AppColors.primaryColor),
              title: Text(
                AppLocalizations.of(context)!.shareThisApp,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            ),
            ListTile(
              onTap: () {},
              leading:
                  const Icon(Icons.ads_click, color: AppColors.primaryColor),
              title: Text(
                AppLocalizations.of(context)!.myAds,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            ),
            ListTile(
              onTap: () {
                customJustGoNavigate(
                    context: context, path: AppRouter.kAboutUs);
              },
              leading: const Icon(Icons.swipe_up_sharp,
                  color: AppColors.primaryColor),
              title: Text(
                AppLocalizations.of(context)!.contactUs,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
