import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/features/favourite/data/models/favorite_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/most_like_properties_model.dart';

abstract class MostLikePropertiesRepository {
  Future<Either<String, MostLikePropertiesModel>> getFavorite();
  Future<Either<String, dynamic>> removeItemFromFavorites(int data);

}
class MostLikePropertiesRepositoryImpl extends MostLikePropertiesRepository {
  final ApiConsumer api;
  MostLikePropertiesRepositoryImpl({required this.api});

  @override
  Future<Either<String, MostLikePropertiesModel>> getFavorite() async{
    try {
      final response = await api.get(
        EndPoint.getMostLikePropertiesAll,
      );

      var data = MostLikePropertiesModel.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
  @override
  Future<Either<String, dynamic>> removeItemFromFavorites(int data) async {
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