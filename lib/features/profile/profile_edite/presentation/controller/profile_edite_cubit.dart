import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_edite_state.dart';

class ProfileEditeCubit extends Cubit<ProfileEditeState> {
  ProfileEditeCubit() : super(ProfileEditeInitial());

  static ProfileEditeCubit get(context) => BlocProvider.of(context);
}
