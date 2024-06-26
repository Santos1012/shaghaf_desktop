import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_repo.dart';
part 'end_reservation_state.dart';

class EndReservationCubit extends Cubit<EndReservationState> {
  EndReservationCubit(this.currentReservationRepo)
      : super(EndReservationInitial());
  final CurrentReservationRepo currentReservationRepo;
  int pageNumber = 1;
  DateTime? x;

  Future<void> endReservation({
    required String reservationId,
  }) async {
    emit(EndReservationLoading());
    final result = await currentReservationRepo.endReservation(
        reservationId: reservationId);

    result.fold(
      (l) {
        log(l.errorMessage);
        emit(EndReservationFailure(l.errorMessage));
      },
      (r) {
        log("success");
        emit(EndReservationSuccess());
      },
    );
  }
}
