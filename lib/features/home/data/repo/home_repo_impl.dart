import 'package:dartz/dartz.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/features/home/data/models/apartment_details_model.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;
  HomeRepoImpl({required this.api});

  @override
  Future<Either<String, BannerResponse>> getBannerData() async {
    try {
      final response = await api.get(
        EndPoint.banners,
      );

      var data = BannerResponse.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, List<FeatureProperty>>>
      getFeaturePropartiesData() async {
    try {
      final response = await api.get(
        EndPoint.getFeatures,
      );
      List<FeatureProperty> data = [];

      for (var element in response['data']) {
        data.add(FeatureProperty.fromJson(element));
      }

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, List<FeatureProperty>>>
      getAllFeaturePropartiesData() async {
    try {
      final response = await api.get(
        EndPoint.getAllFeatures,
      );
      List<FeatureProperty> data = [];

      for (var element in response['data']) {
        data.add(FeatureProperty.fromJson(element));
      }

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, CategoryList>> getCategory() async {
    try {
      final response = await api.get(
        EndPoint.getCategories,
      );

      var data = CategoryList.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, ApartmentDaetails>> getApartmentDetails(int id) async {
    try {
      final response = await api.get(
        EndPoint.getApartmentDeatails(id),
      );

      var data = ApartmentDaetails.fromJson(response['data']);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
