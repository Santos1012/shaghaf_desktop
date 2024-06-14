import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:saghaf_desktop/core/api_service.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/auth/data/models/auth_model.dart';
import 'package:saghaf_desktop/features/auth/data/repositories/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final ApiService apiService;

  AuthRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, AuthModel>> authLogin(
      {required String email, required String password}) async {
    try {
      final res = await apiService.postData(
          data: {"password": password, "email": email},
          endPoint: '/api/users/signin');
      if (res['message'] == "success") {
        return right(
          AuthModel.fromJson(res),
        );
      } else {
        return left(
          ServerFailure(res['message']),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
