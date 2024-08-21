part of 'profile_bloc_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingSharedPreference extends ProfileState {}
final class ProfileSuccessSharedPreference extends ProfileState {
    Map<String,String> sharedPreferenceModel;
    ProfileSuccessSharedPreference(this.sharedPreferenceModel);
}
final class ProfileFailedSharedPreference extends ProfileState {
    final String error;
    ProfileFailedSharedPreference(this.error);
}
