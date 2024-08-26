import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_proparties_state.dart';

class AddPropartiesCubit extends Cubit<AddPropartiesState> {
  AddPropartiesCubit() : super(AddPropartiesInitial());

  static AddPropartiesCubit? get(context) => BlocProvider.of(context);

  TextEditingController propertyNameController = TextEditingController();

  TextEditingController propertyDescriptionController = TextEditingController();

  TextEditingController addressCityController = TextEditingController();

  TextEditingController addressStateController = TextEditingController();

  TextEditingController addressCountryController = TextEditingController();

  TextEditingController adressController = TextEditingController();

  TextEditingController clientAddressController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  Map<String, dynamic> selecties = {};

  bool isSelected = false;

  void selectValue({required int index}) {
    selecties.clear();
    selecties.addAll({'selected': !isSelected, 'index': index});
    print(selecties);

    emit(ChangeAddValues());
  }
}
