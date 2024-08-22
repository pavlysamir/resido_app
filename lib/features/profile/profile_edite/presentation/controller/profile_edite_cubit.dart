import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/features/profile/profile_edite/data/models/profile_edit_model.dart';

import '../../data/repository/profile_edit_repository.dart';
import '../../domain/usecases/get_profile_edit_details_usecase.dart';

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
    response.fold(
      (errMessage) {
        Logger().i("check profile edit screen response error :${errMessage}");
        emit(ProfileEditeFailure(message: errMessage));
        },
      (success) {

        Logger().i("success check profile edit screen response${success}");
        name = success.user.name;
        email = success.user.email;
        phone = success.user.phone;
        address = success.user.address;
        image= success.user.image;

        emit(ProfileEditeSuccess(profileEditModel: success));
      },
    );
  }
}
