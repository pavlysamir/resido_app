import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/profile/profile_edite/ui/widget/text_field_section.dart';
import 'package:resido_app/features/profile/profile_edite/ui/widget/text_field_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../logic/profile_edit_cubit.dart';

class LocationNoteWidget extends StatelessWidget {
  const LocationNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, bottom: 15.0),
      child: Text(
        'This location will enable new section in home screen for nearby properties',
      ),
    );
  }
}

class LocationFieldWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const LocationFieldWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Expanded(
            flex: 8,
            child: TextFieldWidget(
              labelText: '',
              placeHolder: 'Select Location (Optional)',
              isPasswordTextField: false,
              isObscurePassword: true, // or false, depending on your logic
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.my_location_rounded),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ProfileFormWidget
class ProfileFormWidget extends StatelessWidget {
  const ProfileFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileEditCubit.get(context);

    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              // const ProfileImageWidget(),
              const SizedBox(height: 0.0),
              TextFieldSectionWidget(
                label: AppLocalizations.of(context)!.fullName,
                placeholder: cubit.nameController.text ?? '',
                isPassword: false,
                controller: cubit.nameController,
              ),
              TextFieldSectionWidget(
                label: AppLocalizations.of(context)!.emailAddress,
                placeholder: cubit.emailController.text ?? '',
                isPassword: false,
                controller: cubit.emailController,
                enable: false,
              ),
              TextFieldSectionWidget(
                label: AppLocalizations.of(context)!.phoneNum,
                placeholder: cubit.phoneController.text ?? '',
                isPassword: false,
                controller: cubit.phoneController,
              ),
              TextFieldSectionWidget(
                label: 'Address',
                placeholder: cubit.addressController.text ?? '',
                isPassword: false,
                controller: cubit.addressController,
              ),
              // LocationFieldWidget(onPressed: () {
              //   // Handle location selection
              // }),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 15.0),
                child: Text(
                  'This location will enable new section in home screen for nearby properties',
                ),
              )
              //   const LocationNoteWidget(),
              // UpdateButtonWidget(onPressed: () {
              //   cubit.updateProfile(
              //       // name: nameController.text,
              //       // email: emailController.text,
              //       // phone: phoneController.text,
              //       // address: addressController.text,
              //       // image: cubit.file != null ? cubit.base64BackImage : null,
              //       );
              // }),
            ],
          ),
        );
      },
    );
  }
}
