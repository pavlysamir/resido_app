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