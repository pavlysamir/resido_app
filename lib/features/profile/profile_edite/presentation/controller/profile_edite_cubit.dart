import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:ui';
import 'dart:ui';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/features/profile/profile_edite/data/models/profile_edit_model.dart';
import 'package:image/image.dart'as img;
import '../../../../authentications/presentation/managers/register_cubit/register_cubit.dart';
import '../../data/repository/profile_edit_repository.dart';

part 'profile_edite_state.dart';

class ProfileEditeCubit extends Cubit<ProfileEditeState> {
  // final GetProfileEditDetailsUseCase getProfileEditDetailsUseCase;
  ProfileEditeCubit(this.profileEditRepository) : super(ProfileEditeInitial());

  static ProfileEditeCubit get(context) => BlocProvider.of(context);

  ProfileEditRepository profileEditRepository;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;

  getProfileEdit() async {
    emit(ProfileEditeLoading());
    final response = await profileEditRepository.getProfileEdit();
    // 
    response.fold(
      (errMessage) {
        emit(ProfileEditeFailure(message: errMessage));

      },
      (success) {
        name = success.name;
        email = success.email;
        phone = success.phone;
        address = success.address;
        image = success.image;

        emit(ProfileEditeSuccess(profileEditModel: success));
      },
    );
  }

  String? base64BackImage;

  File? file;

  Future<void> pickCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Read the image file
      final bytes = await File(image.path).readAsBytes();
      // Decode the image
      img.Image? originalImage = img.decodeImage(bytes);

      if (originalImage != null) {
        // Resize the image to a smaller size (e.g., width 600 pixels)
        img.Image resizedImage = img.copyResize(originalImage, width: 600);

        // Compress the image (optional)
        List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 30);

        base64BackImage = base64Encode(compressedBytes);

        file = File(image.path);


        // Emit success state
        emit(SuccessfulPickImage());
      } else {
        emit(FailPickImage());
      }
    } else {
      emit(FailPickImage());
    }
  }
}
