import 'package:dartz/dartz.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/core/models/get_users_model.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/room_reservations_models/room_reservations_models.dart';

// import '../../../current_reservation/data/models/reservations_model/reservations_model.dart';

abstract class CurrentReservationRepo {
  CurrentReservationRepo();
  Future<Either<Failures, GetUsersModel>> getAllUsers(
      {required int page, required int limit, required String userType});

  // Future<Either<Failures, List<ReservationsModel>>> getAllReservations();
  Future<Either<Failures, List<RoomReservationsModels>>>
      getAllRoomsReservations();
}
