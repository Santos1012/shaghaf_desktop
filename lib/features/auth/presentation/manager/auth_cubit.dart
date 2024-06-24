import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/auth/data/models/auth_model.dart';
import 'package:saghaf_desktop/features/auth/data/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> authLogin(
      {required String email, required String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    emit(AuthLoading());
    final result = await authRepo.authLogin(email: email, password: password);
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(AuthError(l.errorMessage));
      },
      (r) {
        sharedPreferences.setString("token", r.data?.token ?? "");
        log(r.data!.token!.toString());
        emit(AuthSuccess(r));
      },
    );
  }
}
