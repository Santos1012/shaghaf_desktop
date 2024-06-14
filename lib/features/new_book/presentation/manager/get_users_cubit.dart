import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/new_book/data/models/create_user_model.dart';
import 'package:saghaf_desktop/features/new_book/data/models/get_users_model.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo.dart';
part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit(this.getUsersRepo) : super(GetUsersInitial());
  final GetUsersRepo getUsersRepo;
  int pageNumber = 1;
  Future<void> getAllUsers() async {
    emit(GetUsersLoading());
    final result = await getUsersRepo.getAllUsers(page: 1, limit: 100);
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(GetUsersError(l.errorMessage));
      },
      (r) {
        log(r.message.toString());
        emit(GetUsersSuccess(r));
      },
    );
  }

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
        log(r.message.toString());
        emit(CreateUserSuccess(r));
      },
    );
  }


  Future<void> getAllUsersPagination({bool add = false}) async {
   emit(GetUsersLoading());


    final result = await getUsersRepo.getAllUsers(page: pageNumber,limit: 10);
    result.fold(
          (l) {
        log(l.errorMessage);
        emit(GetUsersError(l.errorMessage));
      },
          (r) {
        add==true?pageNumber++:pageNumber--;
        emit(GetUsersSuccess(r));
      },
    );
  }
}
