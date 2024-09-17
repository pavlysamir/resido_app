

import 'package:dartz/dartz.dart';

import '../models/search_item_model.dart';
import '../models/sub-category_model.dart';
import '../models/unit_data_model.dart';

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
  Future<Either<String, SearchItemModel>> searchItems(String keyword);

}
