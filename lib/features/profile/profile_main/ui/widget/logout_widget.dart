import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences_cash_helper.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
import '../../logic/profile_cubit.dart';
import 'account_dialog_widget.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF087C7C),
          borderRadius: BorderRadius.circular(
              10.0), // Optional: Add border radius
        ),
        child: TextButton.icon(
          onPressed: onPressed,
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0), // Add border radius
            ),
            padding: const EdgeInsets.all(4.0),
            child: const Icon(
              Icons.power_settings_new_outlined,
              color: Color(0xFF087C7C), // Set icon color
            ),
          ),
          label: Text(
            AppLocalizations.of(context)!.logout,
            style: const TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ),
    );
  }
}


class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AccountDialogWidget(
          title: AppLocalizations.of(context)!.logoutConfirmation,
          imagePath: AssetsData.logOutConfirmation,
          message: AppLocalizations.of(context)!.areYouSureWantLogout,
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      style: const TextStyle(color: Color(0xFF087C7C)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileSuccessLogout) {
                    getIt.get<CashHelperSharedPreferences>().clearData();
                    customJustGoNavigate(context: context, path: AppRouter.kLoginScreen);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF087C7C),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                        //  ProfileCubit.get(context).logOut();
                          getIt.get<CashHelperSharedPreferences>().clearData();
                          customJustGoNavigate(context: context, path: AppRouter.kLoginScreen);
                        },
                        child: Text(AppLocalizations.of(context)!.logout, style: const TextStyle(
                            color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}