part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingSharedPreference extends ProfileState {}

final class ProfileSuccessSharedPreference extends ProfileState {
  Map<String, String> sharedPreferenceModel;
  ProfileSuccessSharedPreference(this.sharedPreferenceModel);
}

final class ProfileFailedSharedPreference extends ProfileState {
  final String error;
  ProfileFailedSharedPreference(this.error);
}

// logout state
final class ProfileLoadingLogout extends ProfileState {}

final class ProfileSuccessLogout extends ProfileState {}

final class ProfileFailedLogout extends ProfileState {
  final String error;
  ProfileFailedLogout(this.error);
}

// delete account state
final class ProfileLoadingDeleteAccount extends ProfileState {}

final class ProfileSuccessDeleteAccount extends ProfileState {
  final DeleteModel deleteModel;
  ProfileSuccessDeleteAccount(this.deleteModel);
}

final class ProfileFailedDeleteAccount extends ProfileState {
  final String error;
  ProfileFailedDeleteAccount(this.error);
}

// mode theme state
final class ProfileThemeModeChanged extends ProfileState {
  final bool isDarkMode;
  ProfileThemeModeChanged(this.isDarkMode);
}

final class ProfileFailedToChangeThemeMode extends ProfileState {
  final String error;
  ProfileFailedToChangeThemeMode(this.error);
}

final class ChangeLanguageSuccess extends ProfileState {}
