part of 'end_reservation_cubit.dart';

sealed class EndReservationState {}

final class EndReservationInitial extends EndReservationState {}

final class EndReservationLoading extends EndReservationState {}

final class EndReservationSuccess extends EndReservationState {}

final class EndReservationFailure extends EndReservationState {
  final String errorMessage;
  EndReservationFailure(this.errorMessage);
}
