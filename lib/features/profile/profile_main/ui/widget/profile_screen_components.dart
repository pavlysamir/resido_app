import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:resido_app/features/profile/profile_main/logic/profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';

import 'delete_account_dialog.dart';

Map<String, VoidCallback> getActionsMap(BuildContext context) {
  return {
    // 'My Enquiry': () => Navigator.pushNamed(context, '/myEnquiry'),
    // 'My Advertisements': () => Navigator.pushNamed(context, '/myAdvertisements'),
    // 'Subscription': () => Navigator.pushNamed(context, '/subscription'),
    // 'Transaction History': () => Navigator.pushNamed(context, '/transactionHistory'),
    AppLocalizations.of(context)!.language: () {
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

    AppLocalizations.of(context)!.darkTheme: () {
      // Add your dark theme toggle logic here if needed
    },
    // 'Notifications': () => Navigator.pushNamed(context, '/notifications'),
    // 'Articles': () => Navigator.pushNamed(context, '/articles'),
    // 'Area Converter': () => Navigator.pushNamed(context, '/areaConverter'),
    // 'Share this App': () {
    //   // Add your share logic here
    // },
    AppLocalizations.of(context)!.rateUs: () {},
    AppLocalizations.of(context)!.contactUs: () {
      customJustGoNavigate(context: context, path: AppRouter.kAboutUs);
    },
    AppLocalizations.of(context)!.aboutUs: () {},
    // 'Terms & Conditions': () => Navigator.pushNamed(context, '/termsAndConditions'),
    // 'Privacy Policy': () => Navigator.pushNamed(context, '/privacyPolicy'),
    AppLocalizations.of(context)!.deleteAccount: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteAccountDialog();
        },
      );
    },
  };
}

class CustomInkWell extends StatelessWidget {
  final BuildContext context;
  final int index;
  final List<Map<String, dynamic>> items;

  const CustomInkWell({
    super.key,
    required this.context,
    required this.index,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your logic here
        final action = getActionsMap(context)[items[index]['title']];
        if (action != null) {
          action();
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    items[index]['asset']!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Text(
                  items[index]['title']!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Spacer(),
                items[index]['title'] == AppLocalizations.of(context)!.darkTheme
                    ? Switch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (value) {
                          Logger().i('value: $value');
                          context.read<ProfileCubit>().setThemeMode();
                        },
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.grey,
                          size: 30.0,
                        ),
                      ),
              ],
            ),
          ),
          if (items[index]['title'] != AppLocalizations.of(context)!.deleteAccount) const Divider(),
        ],
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ItemsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomInkWell(context: context, index: index, items: items);
        },
      ),
    );
  }
}
