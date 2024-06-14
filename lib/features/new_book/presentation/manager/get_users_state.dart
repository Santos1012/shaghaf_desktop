part of 'get_users_cubit.dart';

sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersSuccess extends GetUsersState {
  final GetUsersModel getUsersModel;
  GetUsersSuccess(this.getUsersModel);
}

final class GetUsersError extends GetUsersState {
  final String errorMessage;
  GetUsersError(this.errorMessage);
}

final class CreateUserLoading extends GetUsersState {}

final class CreateUserSuccess extends GetUsersState {
  final CreateUserModel createUserModel;
  CreateUserSuccess(this.createUserModel);
}

final class CreateUserError extends GetUsersState {
  final String errorMessage;
  CreateUserError(this.errorMessage);
}

final class GetReservationsLoading extends GetUsersState {}

final class GetReservationsSuccess extends GetUsersState {
  final List<ReservationsModel> getReservationsList;
  final List<DatumGetAllUsers>? getUsersList;
  GetReservationsSuccess(this.getReservationsList, this.getUsersList);
}

final class GetReservationsError extends GetUsersState {
  final String errorMessage;
  GetReservationsError(this.errorMessage);
}

final class UserBookLoading extends GetUsersState {}

final class UserBookSuccess extends GetUsersState {}

final class UserBookError extends GetUsersState {
  final String errorMessage;
  UserBookError(this.errorMessage);
}
