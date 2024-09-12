import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/features/category_details/data/models/category_details_model.dart';
import 'package:resido_app/features/category_details/data/repository/category_details_repository.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  final CategoryDetailsRepository categoryDetailsRepository;
  CategoryDetailsCubit(this.categoryDetailsRepository) : super(CategoryDetailsInitial());
  static CategoryDetailsCubit? get(context) => BlocProvider.of(context);

  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterMinBudgetController =
  TextEditingController();
  final TextEditingController filterMinToBudgetController =
  TextEditingController();

  final TextEditingController filterAreaToController = TextEditingController();

  final TextEditingController filterAreaFromController =
  TextEditingController();
  final TextEditingController location = TextEditingController();
  Map<int, bool> toggleMapType = {1: true};
  bool isSwitched = false;

  toggleCategory(int index) {
    if (toggleMapType[index] == true) {
      toggleMapType.clear();

      emit(SelectCategoryId(
        selectedCategoryId: index,
      ));

      print(toggleMapType);
    } else {
      toggleMapType.clear();
      toggleMapType[index] = true;
      emit(SelectCategoryId(
        selectedCategoryId: index,
      ));
      print(toggleMapType);
    }
  }



  /// Fetches the favorite details from the repository and updates the state.
  CategoryDetailsModel? dataCategoryDetailsModel;
  Future<CategoryDetailsModel> getCategoryDetails(int id) async {
    emit(CategoryDetailsLoading());
    try {
      final response = await categoryDetailsRepository.getCategoryDetails(id);
      return response.fold(
            (errMessage) {
          emit(CategoryDetailsError("Error: $errMessage"));
          throw Exception("Error: $errMessage");
        },
            (success) {
          dataCategoryDetailsModel = success;
          emit(CategoryDetailsSuccess(dataCategoryDetailsModel!));
          return dataCategoryDetailsModel!;
        },
      );
    } catch (e) {
      emit(CategoryDetailsError('Unexpected error: $e'));
      throw Exception('Unexpected error: $e');
    }
  }
  Map<int,bool> isFavorites = {};

  // void removeItemFromFavorites(int id) async {
  //   emit(RemoveMostLikePropertiesLoading());
  //   final response = await categoryDetailsRepository.removeItemFromFavorites(id);
  //   response.fold(
  //         (errMessage) => emit(RemoveMostLikePropertiesFailure(errMessage)),
  //         (data) {
  //       /*
  //           * This is the part where you should update the isFavorites map with the new value
  //           * */
  //       if (isFavorites.containsKey(id)) {
  //         isFavorites[id] = !isFavorites[id]!;
  //       } else {
  //         isFavorites[id] = true; // or false, depending on the initial state
  //       }
  //       // Remove the item from the dataCategoryDetailsModel list
  //       dataCategoryDetailsModel?.data.removeWhere((item) => item.id == id);
  //
  //       emit(RemoveMostLikePropertiesSuccess());
  //     },
  //   );
  // }
  // void updateFavoritesFromMostLike() {
  //   if (dataCategoryDetailsModel != null) {
  //     /*
  //     * this loop will update the isFavorites map with the values from the mostLike model
  //     * and body of this loop should be the same as the body of the loop in the getMostLike method
  //     * */
  //     for (var item in dataCategoryDetailsModel!.data) {
  //       // this mean send item id and item likey to isFavorites map and check
  //       // if item.likey == 1 then isFavorites[item.id] = true else isFavorites[item.id] = false
  //       isFavorites[item.id] = item.likey == 1;
  //     }
  //   }
  // }
}

