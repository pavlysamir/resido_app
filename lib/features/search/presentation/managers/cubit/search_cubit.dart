import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/search/data/models/category_item_model.dart';
import 'package:resido_app/features/search/data/models/unit_data_model.dart';
import 'package:resido_app/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit? get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterMinBudgetController =
      TextEditingController();
  final TextEditingController filterMinToBudgetController =
      TextEditingController();

  final TextEditingController filterAreaToController = TextEditingController();

  final TextEditingController filterAreafromController =
      TextEditingController();
  final TextEditingController location = TextEditingController();

  int? typeId;

  changeType(int index) {
    if (index == 0) {
      typeId = 1;
    } else if (index == 1) {
      typeId = 2;
    }
  }

  List<PropertyDetailsModel> searchList = [];
  search() async {
    emit(SearchLoading());
    final response = await searchRepo.search(
      searchController.text,
    );

    response.fold(
      (errMessage) => emit(SearchFailure(message: errMessage)),
      (search) {
        searchList = search.data;
        emit(SearchSuccess());
      },
    );
  }

  List<PropertyDetailsModel> filterList = [];

  filter() async {
    emit(FilterLoading());
    final response = await searchRepo.filter(
      typeId,
      selectedMapCategory.isEmpty ? null : selectedMapCategory.keys.first,
      filterMinBudgetController.text,
      filterMinToBudgetController.text,
      filterAreafromController.text,
      filterAreaToController.text,
      location.text,
    );

    response.fold(
      (errMessage) => emit(FilterFailure(message: errMessage)),
      (filter) {
        filterList = filter.data;
        emit(FilterSuccess());
      },
    );
  }

  List<DataItem> categoryItems = [];
  getCategory() async {
    emit(GetCategoryLoading());
    final response = await searchRepo.getCategory();

    response.fold(
      (errMessage) => emit(GetCategoryFailure(message: errMessage)),
      (categories) {
        categoryItems = categories.data;
        emit(GetCategorySuccess());
      },
    );
  }

  Future<void> clearFilterData() async {
    filterMinBudgetController.clear();
    filterMinToBudgetController.clear();
    filterAreafromController.clear();
    filterAreaToController.clear();
    location.clear();
    selectedMapCategory.clear();
    filterList.clear();
    typeId = null;

    emit(ClearFilterData());
  }

  Map<int, bool> selectedMapCategory = {};

  selectCategory(int index) {
    if (selectedMapCategory[index] == true) {
      selectedMapCategory.clear();

      emit(SelectCategoryId());

      print(selectedMapCategory);
    } else {
      selectedMapCategory.clear();
      selectedMapCategory[index] = true;
      emit(SelectCategoryId());
      print(selectedMapCategory);
    }
  }
}
