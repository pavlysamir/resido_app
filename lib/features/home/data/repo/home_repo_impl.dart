import 'package:dartz/dartz.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
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
  Future<Either<String, FeaturePropertyList>> getFeaturePropartiesData() async {
    try {
      final response = await api.get(
        EndPoint.getFeatures,
      );

      var data = FeaturePropertyList.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, FeaturePropertyList>>
      getAllFeaturePropartiesData() async {
    try {
      final response = await api.get(
        EndPoint.getAllFeatures,
      );

      var data = FeaturePropertyList.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
