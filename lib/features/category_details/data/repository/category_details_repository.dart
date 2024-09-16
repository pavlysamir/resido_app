import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/api/end_ponits.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../models/category_details_model.dart';
import '../models/category_properties_filter_model.dart';

abstract class CategoryDetailsRepository {
  Future<Either<Failure, CategoryDetailsModel>> getCategoryDetails(int id,
      {int pageNumber});
  // get category properties
  Future<Either<Failure, CategoryPropertiesModel>> getCategoryProperties(
      int id);
}

class CategoryDetailsRepositoryImpl implements CategoryDetailsRepository {
  final ApiConsumer api;
  CategoryDetailsRepositoryImpl({required this.api});

  @override
  Future<Either<Failure, CategoryDetailsModel>> getCategoryDetails(
    int id, {
    int pageNumber = 1,
  }) async {
    // get data from api and return it
    try {
      final response = await api.get('${EndPoint.getCompoundDetails}/$id',
          queryParameters: {'page': pageNumber});
      final categoryDetails = CategoryDetailsModel.fromJson(response);
      return Right(categoryDetails);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryPropertiesModel>> getCategoryProperties(
      int id) async {
    try {
      final response = await api.get(
        EndPoint.getSubCategories,
      );

      var data = CategoryPropertiesModel.fromJson(response);
      Logger().i('CategoryPropertiesModel: $data');
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
