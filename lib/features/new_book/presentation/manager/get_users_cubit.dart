import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/new_book/data/models/create_user_model.dart';
import 'package:saghaf_desktop/features/new_book/data/models/rooms_models/rooms_models.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo.dart';

import '../../../../core/models/get_users_model.dart';
import '../../../current_reservation/data/models/reservations_model/reservations_model.dart';
part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit(this.getUsersRepo) : super(GetUsersInitial());
  final GetUsersRepo getUsersRepo;
  int pageNumber = 1;
  List<DatumGetAllUsers>? r1;

  Future<void> getAllRooms() async {
    emit(GetRoomsLoading());
    final result = await getUsersRepo.getAllRooms();
    final result1 =
        await getUsersRepo.getAllUsers(page: 1, limit: 100, userType: "");
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(GetRoomsError(l.errorMessage));
      },
      (r) {
        result1.fold(
          (l) {
            log(l.errorMessage);
            emit(GetRoomsError(l.errorMessage));
          },
          (r2) {
            // log(r.toString());
            emit(GetRoomsSuccess(r, r2));
          },
        );
      },
    );
  }
  // Future<void> getAllUsersPagination({bool add = false}) async {
  //   emit(GetUsersLoading());

  //   final result = await getUsersRepo.getAllUsers(
  //       page: pageNumber, limit: 10, userType: "user");
  //   result.fold(
  //     (l) {
  //       log(l.errorMessage);
  //       emit(GetUsersError(l.errorMessage));
  //     },
  //     (r) {
  //       add == true ? pageNumber++ : pageNumber--;
  //       emit(GetUsersSuccess(r));
  //     },
  //   );
  // }
}

class CreateUsersCubit extends Cubit<CreateUsersState> {
  CreateUsersCubit(this.getUsersRepo) : super(CreateUsersInitial());
  final GetUsersRepo getUsersRepo;

  Future<void> createUser({
    required String username,
    required String birthdate,
    required String phone,
    required String password,
    required String email,
  }) async {
    emit(CreateUserLoading());
    final result = await getUsersRepo.createUsers(
        username: username,
        birthdate: birthdate,
        phone: phone,
        password: password,
        email: email);
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(CreateUserError(l.errorMessage));
      },
      (r) {
        // log(r.message.toString());
        emit(CreateUserSuccess(r));
      },
    );
  }

  Future<void> createUserBook({
    required String roomId,
    required int seatCount,
    required String startDate,
    required String endDate,
    required String planId,
    required String userId,
  }) async {
    emit(CreateUserBookLoading());
    final result = await getUsersRepo.createRoomBook(
      roomId: roomId,
      seatCount: seatCount,
      startDate: startDate,
      endDate: endDate,
      planId: planId,
      userId: userId,
    );
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(CreateUserBookError(l.errorMessage));
      },
      (r) {
        log("       h                  ");
        emit(CreateUserBookSuccess());
      },
    );
  }
}
