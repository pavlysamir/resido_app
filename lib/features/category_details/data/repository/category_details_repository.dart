import 'package:dartz/dartz.dart';
import 'package:resido_app/core/api/end_ponits.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/failure.dart';
import '../models/category_details_model.dart';

abstract class CategoryDetailsRepository {
  Future<Either<Failure, CategoryDetailsModel>> getCategoryDetails(int id);
}

class CategoryDetailsRepositoryImpl implements CategoryDetailsRepository {
  final ApiConsumer api;
  CategoryDetailsRepositoryImpl({required this.api});

  @override
  Future<Either<Failure, CategoryDetailsModel>> getCategoryDetails(int id) async{
    // get data from api and return it
    try {
      final response = await api.get('${EndPoint.getCompoundDetails}/$id');
      final categoryDetails = CategoryDetailsModel.fromJson(response);
      return Right(categoryDetails);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

}