part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}

final class FilterLoading extends SearchState {}

final class FilterSuccess extends SearchState {}

final class FilterFailure extends SearchState {
  final String message;

  FilterFailure({required this.message});
}

final class GetCategoryLoading extends SearchState {}

final class GetCategorySuccess extends SearchState {}

final class GetCategoryFailure extends SearchState {
  final String message;

  GetCategoryFailure({required this.message});
}

final class SelectCategoryId extends SearchState {}

final class ClearFilterData extends SearchState {}

final class GetMoreSearchLoading extends SearchState {}

final class GetMoreSearchedSuccess extends SearchState {}

final class ClearData extends SearchState {}

final class SearchTypeChanged extends SearchState {}
