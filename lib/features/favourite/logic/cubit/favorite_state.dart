part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

// get data
final class FavoriteLoading extends FavoriteState {}
final class FavoriteSuccess extends FavoriteState {
  final DataFavoriteModel dataFavoriteModel;
  FavoriteSuccess(this.dataFavoriteModel);
}
final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}
