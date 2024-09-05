import 'package:dartz/dartz.dart';
import 'package:resido_app/features/search/data/models/sub-category_model.dart';
import 'package:resido_app/features/search/data/models/unit_data_model.dart';

abstract class SearchRepo {
  Future<Either<String, PaginatedProperties>> search(String keword,
      {int pageNumber = 1});

  Future<Either<String, PaginatedProperties>> filter(
      int? typeId,
      int? categoryId,
      String? priceFrom,
      String? priceTo,
      String? areaFrom,
      String? areaTo,
      String? address,
      {int pageNumber = 1});

  Future<Either<String, DataSubCategoryResponse>> getSubCategory();
}
