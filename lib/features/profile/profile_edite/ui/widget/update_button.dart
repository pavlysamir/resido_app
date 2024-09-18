import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/profile_edit_cubit.dart';

class UpdateButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const UpdateButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        if (state is SuccessfulUpdateProfile) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.finishingUpdateProfile)),
          );
        }else if (state is FailUpdateProfile) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );

        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: state is LoadingUpdateProfile ? null : onPressed,
                child: state is LoadingUpdateProfile
                    ? CircularProgressIndicator(color: AppColors.white)
                    : Text(
                  AppLocalizations.of(context)!.updateProfile,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}