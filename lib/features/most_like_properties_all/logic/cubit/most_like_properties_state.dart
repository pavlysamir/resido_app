part of 'most_like_properties_cubit.dart';

@immutable
sealed class MostLikePropertiesState {}

final class MostLikePropertiesInitial extends MostLikePropertiesState {}

// get data
final class MostLikePropertiesLoading extends MostLikePropertiesState {}
final class MostLikePropertiesSuccess extends MostLikePropertiesState {
  final MostLikePropertiesModel dataMostLikePropertiesModel;
  MostLikePropertiesSuccess(this.dataMostLikePropertiesModel);
}
final class MostLikePropertiesError extends MostLikePropertiesState {
  final String message;
  MostLikePropertiesError(this.message);
}
/// remove item from MostLikeProperties
final class RemoveMostLikePropertiesLoading extends MostLikePropertiesState {}
final class RemoveMostLikePropertiesSuccess extends MostLikePropertiesState {}
final class RemoveMostLikePropertiesFailure extends MostLikePropertiesState {
  final String message;
  RemoveMostLikePropertiesFailure(this.message);
}