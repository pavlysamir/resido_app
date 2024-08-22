import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/search/data/repo/search_auth.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit? get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterMinBudgetController =
      TextEditingController();
  final TextEditingController location = TextEditingController();

  search() async {
    emit(SearchLoading());
    final response = await searchRepo.search(
      searchController.text,
    );

    response.fold(
      (errMessage) => emit(SearchFailure(message: errMessage)),
      (search) {
        emit(SearchSuccess());
      },
    );
  }
}
