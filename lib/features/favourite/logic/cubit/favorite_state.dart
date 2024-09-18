part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

// get data
final class FavoriteLoading extends FavoriteState {}
final class FavoriteSuccess extends FavoriteState {
  final FavoriteModel dataFavoriteModel;
  FavoriteSuccess(this.dataFavoriteModel);
}
final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}
/// remove item from favorite
final class RemoveFavoriteLoading extends FavoriteState {}
final class RemoveFavoriteSuccess extends FavoriteState {}
final class RemoveFavoriteFailure extends FavoriteState {
  final String message;
  RemoveFavoriteFailure(this.message);
}