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
