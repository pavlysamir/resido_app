import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/core/utils/service_locator.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/utils/shared_preferences_cash_helper.dart';

part 'profile_bloc_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()){
   //getSharedPreference();
  }

  static ProfileCubit get(context) => BlocProvider.of(context);

  String? name = getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.userName) ?? "";
  String? email = getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email) ?? "";
  void getSharedPreference() async {
    emit(ProfileLoadingSharedPreference());
    try {
    email = await getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email);
    name = await getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.userName);
      Map<String,String> sharedPreferenceModel = {
        'email': email ?? "",
        'name': name?? "",
      };
      Logger().i('email check : $email');
      Logger().i('name check : $name');
      // set email in controller
    emit(ProfileSuccessSharedPreference(sharedPreferenceModel));
    } catch (e) {
      emit(ProfileFailedSharedPreference(e.toString()));
    }
  }
}
