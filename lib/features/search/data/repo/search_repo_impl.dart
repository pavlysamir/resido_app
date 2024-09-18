import 'package:dartz/dartz.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/features/search/data/models/search_item_model.dart';
import 'package:resido_app/features/search/data/models/sub-category_model.dart';
import 'package:resido_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiConsumer api;
  SearchRepoImpl({required this.api});

  @override
  Future<Either<String, SearchPropertyResponse>> search(String keword,
      {int pageNumber = 1}) async {
    try {
      final response = await api.post(
        EndPoint.search,
        queryParameters: {'page': pageNumber},
        data: {
          'keyword': keword,
        },
      );
      var data = SearchPropertyResponse.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, SearchPropertyResponse>> filter(
      int? typeId,
      int? categoryId,
      String? priceFrom,
      String? priceTo,
      String? areaFrom,
      String? areaTo,
      String? address,
      {int pageNumber = 1}) async {
    try {
      final response = await api.post(EndPoint.filter, data: {
        if (typeId != null) "type_id": typeId,
        if (categoryId != null) "sub_id": categoryId,
        if (priceFrom != null) "price_min": priceFrom,
        if (priceTo != null) "price_max": priceTo,
        if (areaFrom != null) "area_min": areaFrom,
        if (areaTo != null) "area_max": areaTo,
        if (address != null) "address": address,
      }, queryParameters: {
        'page': pageNumber,
      });

      var data = SearchPropertyResponse.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, DataSubCategoryResponse>> getSubCategory() async {
    try {
      final response = await api.get(
        EndPoint.getSubCategories,
      );

      var data = DataSubCategoryResponse.fromJson(response);

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, SearchPropertyResponse>> searchItems(
      String keyword) async {
    try {
      final response = await api.get(
        EndPoint.search,
      );
      // get response
      var data = SearchPropertyResponse.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}
