import 'package:dartz/dartz.dart';
import 'package:resido_app/features/home/data/models/apartment_details_model.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';
import 'package:resido_app/features/home/data/models/category_item_model.dart';
import 'package:resido_app/features/home/data/models/compound_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';

import '../models/most_like_model.dart';

abstract class HomeRepo {
  Future<Either<String, BannerResponse>> getBannerData();
  Future<Either<String, List<FeatureProperty>>> getFeaturePropartiesData();
  Future<Either<String, List<FeatureProperty>>> getAllFeaturePropartiesData();
  Future<Either<String, CategoryList>> getCategory();
  Future<Either<String, ApartmentDaetails>> getApartmentDetails(int id);
  Future<Either<String, List<CompoundModel>>> getCoumpound();
  Future<Either<String,MostLikeModel>> getMostLike();
  /// Create post method to add new property by use 0 and 1 if zero mean not like and 1 mean like
  Future<Either<String, dynamic>> addProperty(int data);

}
