import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/features/profile/profile_main/data/repository/profile_main_repository.dart';

import '../../../../core/Assets/assets.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/utils/shared_preferences_cash_helper.dart';
import '../data/model/delete_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileMainRepository profileMainRepository;
  ProfileCubit(this.profileMainRepository) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  // List of items to be displayed in the profile screen
  final List<Map<String, dynamic>> items = [
    {'title': 'My Enquiry', 'asset': AssetsData.myEnquiry},
    {'title': 'My Advertisements', 'asset': AssetsData.myAdvertisement},
    {'title': 'Subscription', 'asset': AssetsData.subscription},
    {'title': 'Transaction History', 'asset': AssetsData.transaction},
    {'title': 'Language', 'asset': AssetsData.language},
    {'title': 'Dark Theme', 'asset': AssetsData.mode},
    {'title': 'Notifications', 'asset': AssetsData.notification},
    {'title': 'Articles', 'asset': AssetsData.articles},
    {'title': 'Area Converter', 'asset': AssetsData.areaConverter},
    {'title': 'Share this App', 'asset': AssetsData.share},
    {'title': 'Rate us', 'asset': AssetsData.rate},
    {'title': 'Contact us', 'asset': AssetsData.contactUs},
    {'title': 'About us', 'asset': AssetsData.aboutUs},
    {'title': 'Terms & Conditions', 'asset': AssetsData.termsAndConditions},
    {'title': 'Privacy Policy', 'asset': AssetsData.privacyPolicy},
    {
      'title': 'Delete Account',
      'asset': AssetsData.deleteAccount,
      'function': () {}
    },
  ];
  String? name =
      getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.userName) ??
          "";
  String? email =
      getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email) ?? "";
  void getSharedPreference() async {
    emit(ProfileLoadingSharedPreference());
    try {
      email = await getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.email);
      name = await getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.userName);
      Map<String, String> sharedPreferenceModel = {
        'email': email ?? "",
        'name': name ?? "",
      };
      Logger().i('email check : $email');
      Logger().i('name check : $name');
      // set email in controller
      emit(ProfileSuccessSharedPreference(sharedPreferenceModel));
    } catch (e) {
      emit(ProfileFailedSharedPreference(e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(ProfileLoadingLogout());
    try {
      final result = await profileMainRepository.logout();
      result.fold(
        (failure) => emit(ProfileFailedLogout(failure)),
        (success) => emit(ProfileSuccessLogout()),
      );
    } on ServerException catch (error) {
      emit(ProfileFailedLogout(error.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(ProfileLoadingDeleteAccount());
    try {
      final result = await profileMainRepository.deleteAccount();
      result.fold(
        (failure) => emit(ProfileFailedDeleteAccount(failure)),
        (success) async {
          await getIt.get<CashHelperSharedPreferences>().clearData();
          emit(ProfileSuccessDeleteAccount(success));
        },
      );
    } on ServerException catch (error) {
      emit(ProfileFailedDeleteAccount(
          error.errModel.errorMessage![0] ?? 'Server error'));
    }
  }

  Future<void> changeLanguage() async {
    // Toggle the language preference.
    isEnglish = !isEnglish;
    emit(ChangeLanguageSuccess());
    // Save the updated language preference.
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(
          key: 'isEnglishh',
          value: isEnglish,
        )
        .then((value) {
      if (kDebugMode) {
        print(isEnglish);
      }
    });
  }

  Future<void> initializeLanguage() async {
    // Retrieve the saved language preference when the app starts.
    final bool? savedIsEnglish =
        getIt.get<CashHelperSharedPreferences>().getData(
              key: 'isEnglishh',
            );

    // Update the isEnglish variable.
    if (savedIsEnglish != null) {
      isEnglish = savedIsEnglish;
    }
  }
}
