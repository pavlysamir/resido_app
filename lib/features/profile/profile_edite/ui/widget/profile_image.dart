import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/profile_edit_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileEditCubit.get(context);

    return Center(
      child: InkWell(
        onTap: () {
          cubit.pickImageFromGallery();
        },
        child: BlocBuilder<ProfileEditCubit, ProfileEditState>(
          builder: (context, state) {
            return Container(
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
                  if (cubit.selectedImage != null)
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
                          image: cubit.selectedImage != null && cubit.selectedImage!.path.isNotEmpty
                              ? FileImage(File(cubit.selectedImage!.path))
                              : cubit.imageController.text.isNotEmpty
                              ? NetworkImage(cubit.imageController.text)
                              : NetworkImage('https://pmptraining.com.my/new/wp-content/uploads/2023/11/person-pmp.jpg'), // Placeholder image
                        )
                      ),
                    )
                  else
                    Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: AppColors.white,
                        size: 50.0,
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
            );
          },
        ),
      ),
    );
  }
}