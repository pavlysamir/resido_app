import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/DataFavoriteModel.dart';
import '../../data/repository/favorite_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;
  FavoriteCubit(this.favoriteRepository) : super(FavoriteInitial());
  // make instance of FavoriteCubit
  static FavoriteCubit get(context) => BlocProvider.of(context);

  /// Fetches the favorite details from the repository and updates the state.
  Future<void> getFavorite() async {
    emit(FavoriteLoading());
    try {
      final response = await favoriteRepository.getFavorite();
      response.fold(
            (errMessage) => emit(FavoriteError(errMessage)),
            (success) => emit(FavoriteSuccess(success)),
      );
    } catch (e) {
      emit(FavoriteError('Unexpected error: $e'));
    }
  }

}
