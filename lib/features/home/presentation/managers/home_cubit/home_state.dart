part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetBannerSuccess extends HomeState {}

final class GetBannerFailure extends HomeState {
  final String message;
  const GetBannerFailure({required this.message});
}

final class GetBannerLoading extends HomeState {}

final class GetFeaturePropertiesSuccess extends HomeState {}

final class GetFeaturePropertiesFailure extends HomeState {
  final String message;
  const GetFeaturePropertiesFailure({required this.message});
}

final class GetFeaturePropertiesLoading extends HomeState {}

final class GetAllFeaturePropertiesSuccess extends HomeState {}

final class GetAllFeaturePropertiesFailure extends HomeState {
  final String message;
  const GetAllFeaturePropertiesFailure({required this.message});
}

final class GetAllFeaturePropertiesLoading extends HomeState {}

final class GetCategoryLoading extends HomeState {}

final class GetCategorySuccess extends HomeState {}

final class GetCategoryFailure extends HomeState {
  final String message;

  const GetCategoryFailure({required this.message});
}

final class GetApartmentDetailsLoading extends HomeState {}

final class GetApartmentDetailsSuccess extends HomeState {}

final class GetApartmentDetailsFailure extends HomeState {
  final String message;

  const GetApartmentDetailsFailure({required this.message});
}

final class GetCompoundLoading extends HomeState {}

final class GetCompoundSuccess extends HomeState {}

final class GetCompoundFailure extends HomeState {
  final String message;

  const GetCompoundFailure({required this.message});
}
/// This is a most like state
final class GetMostLikeLoading extends HomeState {}
final class GetMostLikeSuccess extends HomeState {}
final class GetMostLikeFailure extends HomeState {
  final String message;
  const GetMostLikeFailure({required this.message});
}
/// Add property to favorite state
final class AddFavoriteLoading extends HomeState {}
final class AddFavoriteSuccess extends HomeState {}
final class AddFavoriteFailure extends HomeState {
  final String message;
  const AddFavoriteFailure({required this.message});
}

final class MakeLikeLoading extends HomeState {}

final class MakeLikeSuccess extends HomeState {}

final class MakeLikeFailure extends HomeState {
  final String message;

  const MakeLikeFailure({required this.message});
}

final class ToggleLikeIcon extends HomeState {}
