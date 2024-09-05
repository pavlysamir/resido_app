import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/features/favourite/data/repository/favorite_model.dart';

import '../../data/repository/favorite_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;
  FavoriteCubit(this.favoriteRepository) : super(FavoriteInitial());
  // make instance of FavoriteCubit
  static FavoriteCubit get(context) => BlocProvider.of(context);

  /// Fetches the favorite details from the repository and updates the state.
  FavoriteModel? dataFavoriteModel;
  Future<void> getFavorite() async {
    emit(FavoriteLoading());
    try {
      final response = await favoriteRepository.getFavorite();
      response.fold(
            (errMessage) => emit(FavoriteError(errMessage)),
            (success) {
          dataFavoriteModel = success;
          emit(FavoriteSuccess(dataFavoriteModel!));
            },
      );
    } catch (e) {
      emit(FavoriteError('Unexpected error: $e'));
    }
  }

  Map<int,bool> isFavorites = {};

  void removeItemFromFavorites(int id) async {
    emit(RemoveFavoriteLoading());
    final response = await favoriteRepository.removeItemFromFavorites(id);
    response.fold(
          (errMessage) => emit(RemoveFavoriteFailure(errMessage)),
          (data) {
        /*
            * This is the part where you should update the isFavorites map with the new value
            * */
        if (isFavorites.containsKey(id)) {
          isFavorites[id] = !isFavorites[id]!;
        } else {
          isFavorites[id] = true; // or false, depending on the initial state
        }
          // Remove the item from the dataFavoriteModel list
            dataFavoriteModel?.data.removeWhere((item) => item.id == id);

        emit(RemoveFavoriteSuccess());
      },
    );
  }
  void updateFavoritesFromMostLike() {
    if (dataFavoriteModel != null) {
      /*
      * this loop will update the isFavorites map with the values from the mostLike model
      * and body of this loop should be the same as the body of the loop in the getMostLike method
      * */
      for (var item in dataFavoriteModel!.data) {
        // this mean send item id and item likey to isFavorites map and check
        // if item.likey == 1 then isFavorites[item.id] = true else isFavorites[item.id] = false
        isFavorites[item.id] = item.likey == 1;
      }
    }
  }
}
