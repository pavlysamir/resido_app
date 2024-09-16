import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/features/home/data/models/apartment_details_model.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';
import 'package:resido_app/features/home/data/models/compound_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/data/repo/home_repo.dart';

import '../models/most_like_model.dart';

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
      Logger().i(response);

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

  @override
  Future<Either<String, List<CompoundModel>>> getCoumpound() async {
    try {
      final response = await api.get(
        EndPoint.getCompound,
      );

      var data = List<CompoundModel>.from(
          response['data'].map((x) => CompoundModel.fromJson(x)));
      Logger().i(
          'CompoundModel: ${data.map((e) => e.name).toList().toString()}'
      );

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, void>> makeLike(int apartmentId) async {
    try {
      final response = await api.post(EndPoint.makeLike, data: {
        'apartment_id': apartmentId,
      });

      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, MostLikeModel>> getMostLike() async {
    try {
      final response = await api.get(
        EndPoint.mostLike,
      );
      //Logger().i(response);
      var data = MostLikeModel.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  /*
  * this method is used to add property to favorite list by passing apartment id
  * */
  @override
  Future<Either<String, dynamic>> addProperty(int data) async {
    try {
      final response = await api.post(
        EndPoint.getFavorite,
        data: {
          'apartment_id': data,
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
