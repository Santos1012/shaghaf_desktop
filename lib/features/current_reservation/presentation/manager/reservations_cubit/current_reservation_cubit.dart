import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:saghaf_desktop/core/models/get_users_model.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/room_reservations_models/room_reservations_models.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_repo.dart';

import '../../../../../core/models/get_users_model.dart';

// import '../../data/models/reservations_model/reservations_model.dart';
part 'current_reservation_state.dart';

class CurrentReservationCubit extends Cubit<CurrentReservationState> {
  CurrentReservationCubit(this.currentReservationRepo)
      : super(CurrentReservationInitial());
  final CurrentReservationRepo currentReservationRepo;
  int pageNumber = 1;
  DateTime? x;
  int refresh = 0;

  Future<void> getRoomsReservations() async {
    emit(CurrentReservationLoading());
    final result = await currentReservationRepo.getAllRoomsReservations();

    final result1 = await currentReservationRepo.getAllUsers(
        page: 1, limit: 100, userType: "");
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(CurrentReservationsError(l.errorMessage));
      },
      (r) {
        result1.fold(
          (l) {
            log(l.errorMessage);
            emit(CurrentReservationsError(l.errorMessage));
          },
          (r2) {
            log(r.length.toString());
            log(r.length.toString());
            log(r.length.toString());
            log(r.length.toString());
            log(r.length.toString());

            emit(CurrentReservationSuccess(r, r2));
            log(r.length.toString());
          },
        );
      },
    );
  }
}
