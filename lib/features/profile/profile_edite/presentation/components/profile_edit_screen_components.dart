import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resido_app/features/profile/profile_edite/presentation/components/profile_image.dart';
import 'package:resido_app/features/profile/profile_edite/presentation/components/text_field_section.dart';
import 'package:resido_app/features/profile/profile_edite/presentation/components/update_button.dart';
import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../controller/profile_edite_cubit.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 16.0, bottom: 15.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Text(
            'Edit Profile',
            style: TextStyle(
              color: Color(0xFF4D5454),
              fontStyle: FontStyle.normal,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}


class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String placeHolder;
  final bool isPasswordTextField;
  final bool isObscurePassword;
  final TextEditingController? controller;
  final bool enable;

  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.placeHolder,
    required this.isPasswordTextField,
    required this.isObscurePassword,
    this.controller,
    this.enable = true, // Default value set to true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        enabled: enable ,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: isPasswordTextField
              ? IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintText: placeHolder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
class LocationNoteWidget extends StatelessWidget {
  const LocationNoteWidget({Key? key}) : super(key: key);

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

  const LocationFieldWidget({Key? key, required this.onPressed}) : super(key: key);

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
  const ProfileFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileEditeCubit.get(context);

    return BlocConsumer<ProfileEditeCubit, ProfileEditeState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              const ProfileImageWidget(),
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
              LocationFieldWidget(onPressed: () {
                // Handle location selection
              }),
              const LocationNoteWidget(),
              UpdateButtonWidget(onPressed: () {
                cubit.updateProfile(
                  // name: nameController.text,
                  // email: emailController.text,
                  // phone: phoneController.text,
                  // address: addressController.text,
                  // image: cubit.file != null ? cubit.base64BackImage : null,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}