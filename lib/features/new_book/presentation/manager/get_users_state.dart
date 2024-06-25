part of 'get_users_cubit.dart';

sealed class GetUsersState {}

sealed class CreateUsersState {}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersSuccess extends GetUsersState {
  final GetUsersModel getUsersModel;
  GetUsersSuccess(this.getUsersModel);
}

final class GetUsersError extends GetUsersState {
  final String errorMessage;
  GetUsersError(this.errorMessage);
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

final class GetRoomsLoading extends GetUsersState {}

final class GetRoomsSuccess extends GetUsersState {
  final List<RoomsModels> roomsModel;
  final GetUsersModel getUsersModel;
  GetRoomsSuccess(this.roomsModel, this.getUsersModel);
}

final class GetRoomsError extends GetUsersState {
  final String errorMessage;
  GetRoomsError(this.errorMessage);
}

final class GetUsersInitial extends GetUsersState {}

final class CreateUsersInitial extends CreateUsersState {}

final class CreateUserLoading extends CreateUsersState {}

final class CreateUserSuccess extends CreateUsersState {
  final CreateUserModel createUserModel;
  CreateUserSuccess(this.createUserModel);
}

final class CreateUserError extends CreateUsersState {
  final String errorMessage;
  CreateUserError(this.errorMessage);
}

final class CreateUserBookLoading extends CreateUsersState {}

final class CreateUserBookSuccess extends CreateUsersState {}

final class CreateUserBookError extends CreateUsersState {
  final String errorMessage;
  CreateUserBookError(this.errorMessage);
}
