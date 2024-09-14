import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../data/models/category_filter_model.dart';
import '../../data/repository/category_filter_repository.dart';

part 'category_filter_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  final CategoryFilterRepository categoryFilterRepository;
  CategoryFilterCubit(this.categoryFilterRepository) : super(CategoryFilterInitial());

  static CategoryFilterCubit get(context) => BlocProvider.of(context);

  CategoryFilterModel? categoryFilterModel;
  getCategoryFilters(
      //int categoryId,
      Map<String,String> listFilter,
      ) async {
    emit(CategoryFilterLoading());
    var categoryId = int.tryParse(listFilter['category_id'] ?? '');
    var address = listFilter['address'];
    var minPrice = listFilter['min_price'];
    var maxPrice = listFilter['max_price'];
    var minWeight = listFilter['min_weight'];
    var maxWeight = listFilter['max_weight'];
    Logger().i('CategoryFilterCubit: getCategoryFilters: categoryId: $categoryId, address: $address, minPrice: $minPrice, maxPrice: $maxPrice, minWeight: $minWeight, maxWeight: $maxWeight');
    final response = await categoryFilterRepository.getCategoryFilters(
      categoryId!,
      address ,
      minPrice,
      maxPrice,
      minWeight,
      maxWeight,
    );
    response.fold(
      (l) => emit(CategoryFilterError(l)),
      (r) {
        categoryFilterModel = r;
        emit(CategoryFilterLoaded(categoryFilterModel!));
      },
    );
  }
}
