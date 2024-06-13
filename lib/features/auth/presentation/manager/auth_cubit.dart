import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/auth/data/models/auth_model.dart';
import 'package:saghaf_desktop/features/auth/data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> authLogin({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await authRepo.authLogin(email: email, password: password);
    result.fold(
      (l) {
        emit(AuthError(l.errorMessage));
      },
      (r) {
        emit(AuthSuccess(r));
      },
    );
  }
}
