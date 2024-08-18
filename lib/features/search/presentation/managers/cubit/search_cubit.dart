import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit? get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterMinBudgetController =
      TextEditingController();
  final TextEditingController location = TextEditingController();
}
