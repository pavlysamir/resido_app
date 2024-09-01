import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/DataFavoriteModel.dart';

abstract class FavoriteRepository {
  Future<Either<String, DataFavoriteModel>> getFavorite();
  Future<Either<String, DataFavoriteModel>> addFavorite(String? id);
  Future<Either<String, DataFavoriteModel>> removeFavorite(String? id);
}
class FavoriteRepositoryImpl extends FavoriteRepository {
  final ApiConsumer api;
  FavoriteRepositoryImpl({required this.api});
  @override
  Future<Either<String, DataFavoriteModel>> addFavorite(String? id) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<String, DataFavoriteModel>> getFavorite() async {
    try {
      var response = await api.get(EndPoint.getFavorite);
      Logger().i(response);
      var data = DataFavoriteModel.fromJson(response['data']);

      return Right(data);
    } on ServerException catch  (error) {
      return Left(error.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, DataFavoriteModel>> removeFavorite(String? id) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }

}