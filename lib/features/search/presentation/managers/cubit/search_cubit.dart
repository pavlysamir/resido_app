import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
  int selectedIndex = 0;

  changeType(int index) {
    selectedIndex = index;
    if (index == 0) {
      typeId = 1;
    } else if (index == 1) {
      typeId = 2;
    }
    // emit(SearchTypeChanged());
  }

  PaginatedProperties? searchList;
  int? count;
  search(int pageNumber) async {
    if (pageNumber == 1) {
      searchList!.data.clear();
    }

    if (pageNumber == 1) {
      emit(SearchLoading());
    } else {
      emit(GetMoreSearchLoading());
    }

    final response = await searchRepo.search(
      searchController.text,
    );

    response.fold(
      (errMessage) => emit(SearchFailure(message: errMessage)),
      (search) {
        if (pageNumber == 1) {
          count = search.total;
        }

        searchList = search;
        if (pageNumber == 1) {
          emit(SearchSuccess());
        } else {
          emit(GetMoreSearchedSuccess());
        }

        searchList = search;
        emit(SearchSuccess());
      },
    );
  }

  PaginatedProperties? filterList;

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
        filterList = filter;
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
    filterList == null;
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

  Map<int, bool> toggleMapType = {0: true};

  toggleCategory(int index) {
    if (toggleMapType[index] == true) {
      toggleMapType.clear();

      emit(SelectCategoryId());

      print(toggleMapType);
    } else {
      toggleMapType.clear();
      toggleMapType[index] = true;
      emit(SelectCategoryId());
      print(toggleMapType);
    }
  }

  Future<void> clearData() async {
    searchController.clear();
    searchList == null;

    emit(ClearData());
  }
}
