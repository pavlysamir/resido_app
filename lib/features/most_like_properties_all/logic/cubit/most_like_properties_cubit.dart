import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/most_like_properties_model.dart';
import '../../data/repository/most_like_properties_repository.dart';

part 'most_like_properties_state.dart';

class MostLikePropertiesCubit extends Cubit<MostLikePropertiesState> {
  final MostLikePropertiesRepository favoriteRepository;
  MostLikePropertiesCubit(this.favoriteRepository) : super(MostLikePropertiesInitial());

  static MostLikePropertiesCubit get(context) => BlocProvider.of(context);

  /// Fetches the favorite details from the repository and updates the state.
  MostLikePropertiesModel? dataMostLikePropertiesModel;
  Future<void> getFavorite() async {
    emit(MostLikePropertiesLoading());
    try {
      final response = await favoriteRepository.getFavorite();
      response.fold(
            (errMessage) => emit(MostLikePropertiesError(errMessage)),
            (success) {
          dataMostLikePropertiesModel = success;
          emit(MostLikePropertiesSuccess(dataMostLikePropertiesModel!));
        },
      );
    } catch (e) {
      emit(MostLikePropertiesError('Unexpected error: $e'));
    }
  }

  Map<int,bool> isFavorites = {};

  void removeItemFromFavorites(int id) async {
    emit(RemoveMostLikePropertiesLoading());
    final response = await favoriteRepository.removeItemFromFavorites(id);
    response.fold(
          (errMessage) => emit(RemoveMostLikePropertiesFailure(errMessage)),
          (data) {
        /*
            * This is the part where you should update the isFavorites map with the new value
            * */
        if (isFavorites.containsKey(id)) {
          isFavorites[id] = !isFavorites[id]!;
        } else {
          isFavorites[id] = true; // or false, depending on the initial state
        }
        // Remove the item from the dataMostLikePropertiesModel list
        dataMostLikePropertiesModel?.data.removeWhere((item) => item.id == id);

        emit(RemoveMostLikePropertiesSuccess());
      },
    );
  }
  void updateFavoritesFromMostLike() {
    if (dataMostLikePropertiesModel != null) {
      /*
      * this loop will update the isFavorites map with the values from the mostLike model
      * and body of this loop should be the same as the body of the loop in the getMostLike method
      * */
      for (var item in dataMostLikePropertiesModel!.data) {
        // this mean send item id and item likey to isFavorites map and check
        // if item.likey == 1 then isFavorites[item.id] = true else isFavorites[item.id] = false
        isFavorites[item.id] = item.likey == 1;
      }
    }
  }
}
