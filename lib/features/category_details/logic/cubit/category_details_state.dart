part of 'category_details_cubit.dart';

@immutable
sealed class CategoryDetailsState {}

final class CategoryDetailsInitial extends CategoryDetailsState {}

// select category id
final class SelectCategoryId extends CategoryDetailsState {
  final int selectedCategoryId;
  SelectCategoryId({required this.selectedCategoryId});
}
