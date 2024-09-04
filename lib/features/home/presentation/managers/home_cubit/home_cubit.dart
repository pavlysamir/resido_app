import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/features/home/data/models/apartment_details_model.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';
import 'package:resido_app/features/home/data/models/compound_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/data/repo/home_repo.dart';

import '../../../data/models/most_like_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  static HomeCubit? get(context) => BlocProvider.of(context);

  final HomeRepo homeRepository;

  List<BannerModel> bannerList = [];

  getBanner() async {
    emit(GetBannerLoading());
    final response = await homeRepository.getBannerData();

    response.fold(
          (errMessage) => emit(GetBannerFailure(message: errMessage)),
          (banners) {
        bannerList = banners.data;
        emit(GetBannerSuccess());
      },
    );
  }

  List<FeatureProperty> featureProperties = [];
  getFeatureProparties() async {
    emit(GetFeaturePropertiesLoading());
    final response = await homeRepository.getFeaturePropartiesData();

    response.fold(
          (errMessage) => emit(GetFeaturePropertiesFailure(message: errMessage)),
          (featureProp) {
        featureProperties = featureProp;
        emit(GetFeaturePropertiesSuccess());
      },
    );
  }

  List<FeatureProperty> allFeatureProperties = [];
  getAllFeatureProparties() async {
    emit(GetAllFeaturePropertiesLoading());
    final response = await homeRepository.getAllFeaturePropartiesData();

    response.fold(
          (errMessage) => emit(GetAllFeaturePropertiesFailure(message: errMessage)),
          (featureProp) {
        allFeatureProperties = featureProp;
        emit(GetAllFeaturePropertiesSuccess());
      },
    );
  }

  List<Category> categoryItems = [];
  getCategory() async {
    emit(GetCategoryLoading());
    final response = await homeRepository.getCategory();

    response.fold(
          (errMessage) => emit(GetCategoryFailure(message: errMessage)),
          (categories) {
        categoryItems = categories.data;
        emit(GetCategorySuccess());
      },
    );
  }

  ApartmentDaetails? apartmentDetails;
  getApartmentDetails(int id) async {
    emit(GetCategoryLoading());
    final response = await homeRepository.getApartmentDetails(id);

    response.fold(
          (errMessage) => emit(GetCategoryFailure(message: errMessage)),
          (apartmentDetails) {
        apartmentDetails = apartmentDetails;
        emit(GetCategorySuccess());
      },
    );
  }

  List<CompoundModel> copoundList = [];
  getCompounds() async {
    emit(GetCompoundLoading());
    final response = await homeRepository.getCoumpound();

    response.fold(
          (errMessage) => emit(GetCompoundFailure(message: errMessage)),
          (compounds) {
        copoundList = compounds;
        emit(GetCompoundSuccess());
      },
    );
  }
  // get most like from repository
  MostLikeModel? mostLike;
  getMostLike() async {
    emit(GetMostLikeLoading());
    final response = await homeRepository.getMostLike();
    response.fold(
          (errMessage) => emit(GetMostLikeFailure(message: errMessage)),
          (mostLike) {
        this.mostLike = mostLike;
        updateFavoritesFromMostLike();
        emit(GetMostLikeSuccess());
      },
    );
  }
  Map<int,bool> isFavorites = {};

  void addPropertyToFavorites(int id) async {
    emit(AddFavoriteLoading());
    final response = await homeRepository.addProperty(id);
    response.fold(
          (errMessage) => emit(AddFavoriteFailure(message: errMessage)),
          (data) {
            /*
            * This is the part where you should update the isFavorites map with the new value
            * */
        if (isFavorites.containsKey(id)) {
          isFavorites[id] = !isFavorites[id]!;
        } else {
          isFavorites[id] = true; // or false, depending on the initial state
        }

        emit(AddFavoriteSuccess());
      },
    );
  }
  void updateFavoritesFromMostLike() {
    if (mostLike != null) {
      /*
      * this loop will update the isFavorites map with the values from the mostLike model
      * and body of this loop should be the same as the body of the loop in the getMostLike method
      * */
      for (var item in mostLike!.data) {
        // this mean send item id and item likey to isFavorites map and check
        // if item.likey == 1 then isFavorites[item.id] = true else isFavorites[item.id] = false
        isFavorites[item.id] = item.likey == 1;
      }
    }
  }
}
