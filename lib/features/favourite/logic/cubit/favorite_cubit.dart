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

  // get data from api from repository
  Future<void> getFavorite() async {
    emit(FavoriteLoading());
    final response = await favoriteRepository.getFavorite();
    // check if response is success or error
    response.fold(
      (errMessage) {
        emit(FavoriteError(errMessage));
      },
      (success) {
        emit(FavoriteSuccess(success));
      },
    );
  }

}
