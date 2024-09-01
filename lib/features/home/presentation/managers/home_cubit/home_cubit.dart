import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/home/data/models/apartment_details_model.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';
import 'package:resido_app/features/home/data/models/compound_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/data/repo/home_repo.dart';

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
}
