import 'package:dartz/dartz.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  AuthRepo();
  Future<Either<Failures, AuthModel>> authLogin({
    required String email,
    required String password,
  });
}
