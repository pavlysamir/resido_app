import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());
  static CategoryDetailsCubit? get(context) => BlocProvider.of(context);

  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterMinBudgetController =
  TextEditingController();
  final TextEditingController filterMinToBudgetController =
  TextEditingController();

  final TextEditingController filterAreaToController = TextEditingController();

  final TextEditingController filterAreaFromController =
  TextEditingController();
  final TextEditingController location = TextEditingController();
  Map<int, bool> toggleMapType = {1: true};
  bool isSwitched = false;

  toggleCategory(int index) {
    if (toggleMapType[index] == true) {
      toggleMapType.clear();

      emit(SelectCategoryId(
        selectedCategoryId: index,
      ));

      print(toggleMapType);
    } else {
      toggleMapType.clear();
      toggleMapType[index] = true;
      emit(SelectCategoryId(
        selectedCategoryId: index,
      ));
      print(toggleMapType);
    }
  }

}
