part of 'profile_edite_cubit.dart';

@immutable
sealed class ProfileEditeState {}

final class ProfileEditeInitial extends ProfileEditeState {}

final class ProfileEditeLoading extends ProfileEditeState{}

final class ProfileEditeSuccess extends ProfileEditeState{
  final DataProfileEditModel profileEditModel;
  ProfileEditeSuccess({required this.profileEditModel});
}
final class ProfileEditeFailure extends ProfileEditeState{
  final String message;
  ProfileEditeFailure({required this.message});
}
