import 'package:dartz/dartz.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/new_book/data/models/create_user_model.dart';
import 'package:saghaf_desktop/core/models/get_users_model.dart';
import 'package:saghaf_desktop/features/new_book/data/models/rooms_models/rooms_models.dart';

import '../../../current_reservation/data/models/reservations_model/reservations_model.dart';

abstract class GetUsersRepo {
  GetUsersRepo();
  Future<Either<Failures, GetUsersModel>> getAllUsers(
      {required int page, required int limit, required String userType});
  Future<Either<Failures, CreateUserModel>> createUsers({
    required String username,
    required String birthdate,
    required String phone,
    required String password,
    required String email,
  });
  Future<Either<Failures, void>> createRoomBook({
    required String roomId,
    required int seatCount ,
    required String startDate,
    required String endDate,
    required String planId,
    required String userId,
  });
  Future<Either<Failures, void>> userBook({
    required String userId,
    required String bookDate,
  });
  Future<Either<Failures, List<ReservationsModel>>> getAllReservations();
  Future<Either<Failures, List<RoomsModels>>> getAllRooms();
}
