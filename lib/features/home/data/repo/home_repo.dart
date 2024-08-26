import 'package:dartz/dartz.dart';
import 'package:resido_app/features/home/data/models/banner_model.dart';

abstract class HomeRepo {
  Future<Either<String, BannerResponse>> getBannerData();
}
