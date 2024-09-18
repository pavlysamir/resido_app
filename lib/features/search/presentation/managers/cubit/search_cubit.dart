import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/features/search/data/models/sub-category_model.dart';
import 'package:resido_app/features/search/data/models/unit_data_model.dart';
import 'package:resido_app/features/search/data/repo/search_repo.dart';

import '../../../data/models/search_item_model.dart';

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

  SearchPropertyResponse? searchList;
  int? count;
  search(int pageNumber) async {
    if (pageNumber == 1) {
      //searchList!.data.clear();
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
      },
    );
  }

  SearchPropertyResponse? filterList;
  int? countFilter;

  filter(int pageNumber) async {
    try {
      if (pageNumber == 1) {
        emit(FilterLoading());
      } else {
        emit(GetMoreSearchLoading());
      }
      // Check if toggleMapType and selectedMapCategory are not empty before accessing first element
      final toggleMapTypeKey =
          toggleMapType.isNotEmpty ? toggleMapType.keys.first : null;
      final selectedMapCategoryKey =
          selectedMapCategory == null ? null : selectedMapCategory!.keys.first;

      final response = await searchRepo.filter(
        toggleMapTypeKey,
        selectedMapCategoryKey,
        filterMinBudgetController.text == ''
            ? null
            : filterMinBudgetController.text,
        filterMinToBudgetController.text == ''
            ? null
            : filterMinToBudgetController.text,
        filterAreafromController.text == ''
            ? null
            : filterAreafromController.text,
        filterAreaToController.text == '' ? null : filterAreaToController.text,
        location.text == '' ? null : location.text,
      );

      response.fold(
        (errMessage) => emit(FilterFailure(message: errMessage)),
        (filter) {
          if (pageNumber == 1) {
            countFilter = filter.total;
          }

          filterList = filter;
          if (pageNumber == 1) {
            emit(FilterSuccess());
          } else {
            emit(GetMoreSearchedSuccess());
          }
        },
      );
    } on Exception catch (e) {
      Logger().i(e.toString());
    }
  }

  List<DataItem>? subCategoryItems = [];
  getSubCategory() async {
    emit(GetCategoryLoading());
    final response = await searchRepo.getSubCategory();

    response.fold(
      (errMessage) => emit(GetCategoryFailure(message: errMessage)),
      (categories) {
        subCategoryItems = categories.data;
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
    selectedMapCategory!.clear();
    filterList == null;
    typeId = null;

    emit(ClearFilterData());
  }

  Map<int, bool>? selectedMapCategory = {1: true};

  selectCategory(int? index) {
    if (selectedMapCategory![index] == true) {
      selectedMapCategory!.clear();

      emit(SelectCategoryId());

      print(selectedMapCategory);
    } else {
      selectedMapCategory?.clear();
      selectedMapCategory?[index!] = true;
      emit(SelectCategoryId());
      print(selectedMapCategory);
    }
  }

  Map<int, bool> toggleMapType = {1: true};

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

  List<PropertyData>? searchItems = [];
// how can use recentSearch
  List<String> recentSearches = [];

  emitSearchItems(String keyword) async {
    emit(SearchItemsLoading());
    final response = await searchRepo.searchItems(keyword);
    response.fold(
      (errMessage) => emit(SearchItemsFailure(message: errMessage)),
      (items) {
        searchItems = items.data;
        // Add the keyword to recent searches if it's not already there
        if (!recentSearches.contains(keyword)) {
          recentSearches.add(keyword);
        }
        emit(SearchItemsSuccess(searchItems: items));
      },
    );
  }
}
