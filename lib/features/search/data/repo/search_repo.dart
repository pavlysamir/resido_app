import 'package:dartz/dartz.dart';
import 'package:resido_app/features/search/data/models/category_item_model.dart';
import 'package:resido_app/features/search/data/models/unit_data_model.dart';

abstract class SearchRepo {
  Future<Either<String, UnitDataModel>> search(String keword);

  Future<Either<String, UnitDataModel>> filter(
      int? typeId,
      int? categoryId,
      String? priceFrom,
      String? priceTo,
      String? areaFrom,
      String? areaTo,
      String? address);

  Future<Either<String, DataCategoryResponse>> getCategory();
}
