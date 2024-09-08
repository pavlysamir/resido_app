import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/features/favourite/data/models/favorite_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';

abstract class FavoriteRepository {
  Future<Either<String, FavoriteModel>> getFavorite();
  Future<Either<String, dynamic>> removeItemFromFavorites(int data);

}
class FavoriteRepositoryImpl extends FavoriteRepository {
  final ApiConsumer api;
  FavoriteRepositoryImpl({required this.api});

  @override
  Future<Either<String, FavoriteModel>> getFavorite() async{
   try {
      final response = await api.get(
        EndPoint.getFavorite,
      );

      var data = FavoriteModel.fromJson(response);

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