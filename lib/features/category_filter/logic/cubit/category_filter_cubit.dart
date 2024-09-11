import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_filter_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  CategoryFilterCubit() : super(CategoryFilterInitial());

  static CategoryFilterCubit get(context) => BlocProvider.of(context);
}
