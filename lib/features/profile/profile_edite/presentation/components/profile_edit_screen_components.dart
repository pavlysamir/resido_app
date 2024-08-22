import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
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

  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.placeHolder,
    required this.isPasswordTextField,
    required this.isObscurePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
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


class UpdateButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const UpdateButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: onPressed,
            child: Text(
              AppLocalizations.of(context)!.updateProfile,
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
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


class TextFieldSectionWidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;

  const TextFieldSectionWidget({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.darkGrey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextFieldWidget(
            labelText: '',
            placeHolder: placeholder,
            isPasswordTextField: isPassword,
            isObscurePassword: true, // or false, depending on your logic
          ),
        )
      ],
    );
  }
}


class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        _image = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.darkGrey,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: AppColors.black.withOpacity(0.1),
                      offset: const Offset(0, 10),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: _image == null
                        ? const NetworkImage('https://th.bing.com/th/id/OIP.6tUU7elzE78McOxUt5y-wwHaEO?rs=1&pid=ImgDetMain')
                        : FileImage(File(_image!.path)) as ImageProvider,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    color: AppColors.darkGrey,
                  ),
                  child: const Image(
                    image: AssetImage(
                      AssetsData.profileEdit,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
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
            child: GestureDetector(
              onTap: () {
                // cubit.updateProfile();
              },
              child: Column(
                children: [
                  const ProfileImageWidget(),
                  const SizedBox(height: 0.0),
                  TextFieldSectionWidget(
                    label: AppLocalizations.of(context)!.callUs,
                    placeholder: cubit.name ??'',
                    isPassword: false,
                  ),
                  TextFieldSectionWidget(
                    label: AppLocalizations.of(context)!.callUs,
                    placeholder: cubit.email??'',
                    isPassword: false,
                  ),
                  TextFieldSectionWidget(
                    label: AppLocalizations.of(context)!.phoneNum,
                    placeholder: cubit.phone ??'',
                    isPassword: false,
                  ),
                  TextFieldSectionWidget(
                    label: 'Address',
                    placeholder: cubit.address ??'',
                    isPassword: false,
                  ),
                  LocationFieldWidget(onPressed: () {
                    // Handle location selection
                  }),
                  const LocationNoteWidget(),
                  UpdateButtonWidget(onPressed: () {
                    // Handle update profile
                  }),
                ],
              ),
            ),
          );

      },
    );
  }
}