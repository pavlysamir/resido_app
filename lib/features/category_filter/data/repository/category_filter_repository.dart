import 'package:dartz/dartz.dart';
import 'package:resido_app/features/category_filter/data/models/category_filter_model.dart';

abstract class CategoryFilterRepository {
  Future<Either<String,CategoryFilterModel>> getCategoryFilters();
}
// implementation
class CategoryFilterRepositoryImpl implements CategoryFilterRepository {
  @override
  Future<Either<String, CategoryFilterModel>> getCategoryFilters() {
    // TODO: implement getCategoryFilters
    throw UnimplementedError();
  }

}