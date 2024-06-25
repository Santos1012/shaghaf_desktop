part of 'current_reservation_cubit.dart';

sealed class CurrentReservationState {}

final class CurrentReservationInitial extends CurrentReservationState {}

final class CurrentReservationLoading extends CurrentReservationState {}

final class CurrentReservationSuccess extends CurrentReservationState {
  final List<RoomReservationsModels> getReservationsList;
  final GetUsersModel? getUsersList;
  CurrentReservationSuccess(this.getReservationsList, this.getUsersList);
}

final class CurrentReservationsError extends CurrentReservationState {
  final String errorMessage;
  CurrentReservationsError(this.errorMessage);
}

