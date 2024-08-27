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
