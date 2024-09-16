import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import '../../logic/profile_edit_cubit.dart';
import '../widget/profile_edit_screen_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileEditeScreen extends StatelessWidget {
  ProfileEditeScreen({super.key});

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        // listen of state
      },
      builder: (context, state) {
        var cubit = ProfileEditCubit.get(context);

        return Scaffold(
          appBar: CustomAppBar(
            title: AppLocalizations.of(context)!.editProfile,
            function: () {
              Navigator.pop(context);
            },
            actions: [
              IconButton(
                onPressed: () {
                  cubit.updateProfile(
                      // name: nameController.text,
                      // email: emailController.text,
                      // phone: phoneController.text,
                      // address: addressController.text,
                      // image: cubit.file != null ? cubit.base64BackImage : null,
                      );
                },
                icon: const Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0.0),
                ProfileFormWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
