import 'package:dartz/dartz.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/features/search/data/models/category_item_model.dart';
import 'package:resido_app/features/search/data/models/unit_data_model.dart';
import 'package:resido_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiConsumer api;
  SearchRepoImpl({required this.api});

  @override
  Future<Either<String, PaginatedProperties>> search(String keword,
      {int pageNumber = 1}) async {
    try {
      final response = await api.post(
        EndPoint.search,
        queryParameters: {'page': pageNumber},
        data: {
          'keword': keword,
        },
      );
      var data = PaginatedProperties.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, PaginatedProperties>> filter(
      int? typeId,
      int? categoryId,
      String? priceFrom,
      String? priceTo,
      String? areaFrom,
      String? areaTo,
      String? address) async {
    try {
      final response = await api.post(
        EndPoint.filter,
        queryParameters: {
          if (typeId != null) "type_id": typeId,
          if (categoryId != null) "category_id": categoryId,
          if (priceFrom != null) "price_from": priceFrom,
          if (priceTo != null) "price_to": priceTo,
          if (areaFrom != null) "area_from": areaFrom,
          if (areaTo != null) "area_to": areaTo,
          if (address != null) "address": address,
        },
      );

      var data = PaginatedProperties.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, DataCategoryResponse>> getCategory() async {
    try {
      final response = await api.get(
        EndPoint.getCategories,
      );

      var data = DataCategoryResponse.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
