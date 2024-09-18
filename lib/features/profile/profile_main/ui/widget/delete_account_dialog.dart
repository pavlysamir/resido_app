import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
import '../../logic/profile_cubit.dart';
import 'account_dialog_widget.dart';

class DeleteAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountDialogWidget(
      title: AppLocalizations.of(context)!.deleteAccount,
      imagePath: AssetsData.deleteAccountAlertDialog,
      message: AppLocalizations.of(context)!.deleteAccountMessage,
      actions: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF087C7C),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  context.read<ProfileCubit>().deleteAccount().then((_) {
                    customGoAndDeleteNavigate(
                        context: context, path: AppRouter.kLoginScreen);
                  });
                },
                child: Text(AppLocalizations.of(context)!.delete, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}