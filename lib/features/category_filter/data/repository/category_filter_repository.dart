import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/features/category_filter/data/models/category_filter_model.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';

abstract class CategoryFilterRepository {
  Future<Either<String, CategoryFilterModel>> getCategoryFilters(
      int categoryId,
      String? address,
      String? minPrice,
      String? maxPrice,
      String? minWeight,
      String? maxWeight);
}

// implementation
class CategoryFilterRepositoryImpl implements CategoryFilterRepository {
  ApiConsumer api;
  CategoryFilterRepositoryImpl({required this.api});
  @override
  Future<Either<String, CategoryFilterModel>> getCategoryFilters(
      int categoryId,
      String? address,
      String? minPrice,
      String? maxPrice,
      String? minWeight,
      String? maxWeight) async {
    try {
      final response = await api.post(
        EndPoint.getCategoryFilter,
        data: {
          'category_id': categoryId,
          if (address != null && address.isNotEmpty)
          'address': address,
          if (minPrice != null && minPrice.isNotEmpty)
          'min_price': minPrice,
          if (maxPrice != null && maxPrice.isNotEmpty)
          'max_price': maxPrice,
          if (minWeight != null && minWeight.isNotEmpty)
          'min_weight': minWeight,
          if (maxWeight != null && maxWeight.isNotEmpty)
          'max_weight': maxWeight,
        },
      );
      var data = CategoryFilterModel.fromJson(response);
      Logger().i(data);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
