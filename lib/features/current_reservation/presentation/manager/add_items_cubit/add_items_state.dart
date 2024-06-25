part of 'add_items_cubit.dart';

sealed class AddItemsState {}

final class AddItemsInitial extends AddItemsState {}

final class AddItemsLoading extends AddItemsState {}

final class AddItemsSuccess extends AddItemsState {}

final class AddItemsFailure extends AddItemsState {
  final String errorMessage;
  AddItemsFailure(this.errorMessage);
}
