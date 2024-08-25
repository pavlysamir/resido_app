import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:ui';
import 'dart:ui';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/features/profile/profile_edite/data/models/profile_edit_model.dart';
import 'package:image/image.dart' as img;
import '../../../../authentications/presentation/managers/register_cubit/register_cubit.dart';
import '../../data/repository/profile_edit_repository.dart';

part 'profile_edite_state.dart';

class ProfileEditeCubit extends Cubit<ProfileEditeState> {
  ProfileEditeCubit(this.profileEditRepository) : super(ProfileEditeInitial());

  static ProfileEditeCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var imageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage ;


  ProfileEditRepository profileEditRepository;

  /// Fetches the profile edit details from the repository and updates the state.
  Future<void> getProfileEdit() async {
    emit(ProfileEditeLoading());
    final response = await profileEditRepository.getProfileEdit();
    response.fold(
          (errMessage) {
        emit(ProfileEditeFailure(message: errMessage));
      },
          (success) {
        nameController.text = success.name;
        emailController.text = success.email;
        phoneController.text = success.phone!;
        addressController.text = success.address!;
        imageController.text = success.image;
        emit(ProfileEditeSuccess(profileEditModel: success));
      },
    );
  }

  /// Updates the profile with the current values in the controllers and the selected image.
  Future<void> updateProfile() async {
    emit(ProfileEditeLoading());
    final response = await profileEditRepository.updateProfileEdit(
      nameController.text,

      phoneController.text,
      addressController.text,
      selectedImage as String?
    );
    bool isSuccess = false;
    response.fold(
          (errMessage) {
        emit(ProfileEditeFailure(message: errMessage));
        isSuccess = false;
      },
          (success) {
        emit(ProfileEditeSuccess(profileEditModel: success));
        isSuccess = true;
      },
    );
    Logger().i('isSuccess check here : $isSuccess and response is : $response');
  }

  String? base64BackImage;
  File? file;


  /// Picks an image from the gallery and updates the state.
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? selectedImageFromClick= await _picker.pickImage(source: ImageSource.gallery);
      if (selectedImageFromClick != null) {
        selectedImage = selectedImageFromClick;
        emit(SuccessfulPickImage());
      } else {
        emit(FailPickImage());
      }
    } catch (e) {
      emit(FailPickImage());
    }
  }
}