part of 'category_filter_cubit.dart';

@immutable
sealed class CategoryFilterState {}

final class CategoryFilterInitial extends CategoryFilterState {}

final class CategoryFilterLoading extends CategoryFilterState {}
final class CategoryFilterLoaded extends CategoryFilterState {
  final CategoryFilterModel categoryFilterModel;
  CategoryFilterLoaded(this.categoryFilterModel);
}
final class CategoryFilterError extends CategoryFilterState {
  final String error;
  CategoryFilterError(this.error);
}