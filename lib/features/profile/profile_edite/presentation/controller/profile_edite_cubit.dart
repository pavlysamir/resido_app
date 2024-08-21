import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/get_profile_edit_details_usecase.dart';

part 'profile_edite_state.dart';

class ProfileEditeCubit extends Cubit<ProfileEditeState> {
 // final GetProfileEditDetailsUseCase getProfileEditDetailsUseCase;
  ProfileEditeCubit() : super(ProfileEditeInitial());

  static ProfileEditeCubit get(context) => BlocProvider.of(context);

}
