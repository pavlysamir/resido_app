part of 'profile_edit_cubit.dart';

@immutable
sealed class ProfileEditState {}

final class ProfileEditeInitial extends ProfileEditState {}

final class ProfileEditeLoading extends ProfileEditState{}

final class ProfileEditeSuccess extends ProfileEditState{
  final DataProfileEditModel profileEditModel;
  ProfileEditeSuccess({required this.profileEditModel});
}
final class ProfileEditeFailure extends ProfileEditState{
  final String message;
  ProfileEditeFailure({required this.message});
}
final class SuccessfulPickImage extends ProfileEditState{}
final class FailPickImage extends ProfileEditState{}

final class LoadingUpdateProfile extends ProfileEditState{}
final class SuccessfulUpdateProfile extends ProfileEditState{
  final DataProfileEditModel profileEditModel;
  SuccessfulUpdateProfile({required this.profileEditModel});
}
final class FailUpdateProfile extends ProfileEditState{
  final String message;
  FailUpdateProfile({required this.message});
}

