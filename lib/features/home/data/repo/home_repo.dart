import 'package:dartz/dartz.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';

abstract class HomeRepo {
  Future<Either<String, BannerResponse>> getBannerData();
  Future<Either<String, List<FeatureProperty>>> getFeaturePropartiesData();
  Future<Either<String, List<FeatureProperty>>> getAllFeaturePropartiesData();
}
