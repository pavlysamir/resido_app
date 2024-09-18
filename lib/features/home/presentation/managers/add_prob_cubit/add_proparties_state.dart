part of 'add_proparties_cubit.dart';

sealed class AddPropartiesState extends Equatable {
  const AddPropartiesState();

  @override
  List<Object> get props => [];
}

final class AddPropartiesInitial extends AddPropartiesState {}

final class ChangeAddValues extends AddPropartiesState {}
