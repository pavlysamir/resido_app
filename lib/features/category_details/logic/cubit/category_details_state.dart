part of 'category_details_cubit.dart';

@immutable
sealed class CategoryDetailsState {}

final class CategoryDetailsInitial extends CategoryDetailsState {}

// select category id
final class SelectCategoryId extends CategoryDetailsState {
  final int selectedCategoryId;
  SelectCategoryId({required this.selectedCategoryId});
}
// get category details
final class CategoryDetailsLoading extends CategoryDetailsState {}
final class CategoryDetailsError extends CategoryDetailsState {
  final String message;
  CategoryDetailsError(this.message);
}
final class CategoryDetailsSuccess extends CategoryDetailsState {
  final CategoryDetailsModel categoryDetailsModel;
  CategoryDetailsSuccess(this.categoryDetailsModel);
}
// get category properties
final class CategoryPropertiesLoading extends CategoryDetailsState {}
final class CategoryPropertiesError extends CategoryDetailsState {
  final String message;
  CategoryPropertiesError(this.message);
}
final class CategoryPropertiesSuccess extends CategoryDetailsState {
  final CategoryPropertiesModel categoryPropertiesModel;
  CategoryPropertiesSuccess(this.categoryPropertiesModel);
}
// pagination
final class CategoryDetailsLoadingMore extends CategoryDetailsState {}
final class CategoryDetailsErrorMore extends CategoryDetailsState {
  final String message;
  CategoryDetailsErrorMore(this.message);
}
final class CategoryDetailsSuccessMore extends CategoryDetailsState {
  final CategoryDetailsModel categoryDetailsModel;
  CategoryDetailsSuccessMore(this.categoryDetailsModel);
}