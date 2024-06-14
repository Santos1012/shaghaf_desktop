// import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:saghaf_desktop/core/api_service.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/new_book/data/models/create_user_model.dart';
import 'package:saghaf_desktop/features/new_book/data/models/get_users_model.dart';
import 'package:saghaf_desktop/features/new_book/data/models/reservations_model/reservations_model.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo.dart';

class GetUsersRepoImplementation extends GetUsersRepo {
  final ApiService apiService;

  GetUsersRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, GetUsersModel>> getAllUsers(
      {required int page, required int limit}) async {
    try {
      final res = await apiService.getData(
          endPoint: '/api/users?userType=user&page=$page&limit=$limit');
      if (res['message'] == "success") {
        return right(
          GetUsersModel.fromJson(res),
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

  @override
  Future<Either<Failures, List<ReservationsModel>>> getAllReservations() async {
    List<ReservationsModel> resList = [];
    try {
      final res = await apiService.getData(
          endPoint: '/api/members/book?limit=100&paid=false');
      if (res['message'] == "success") {
        for (var element in res["data"]) {
          resList.add(ReservationsModel.fromJson(element));
        }
        // log(resList.toString());
        return right(
          resList,
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

  @override
  Future<Either<Failures, CreateUserModel>> createUsers({
    required String username,
    required String birthdate,
    required String phone,
    required String password,
    required String email,
  }) async {
    try {
      final res = await apiService.postData(data: {
        "username": username,
        "birthdate": birthdate,
        "phone": phone,
        "password": password,
        "email": email,
        "userType": "user"
      }, endPoint: '/api/users/admin');
      if (res['message'] == "success") {
        return right(
          CreateUserModel.fromJson(res),
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

  @override
  Future<Either<Failures, void>> userBook({
    required String userId,
    required String bookDate,
  }) async {
    try {
      final res = await apiService.postData(data: {
        "member": "666be369522bd948bcf9b535",
        "user": userId,
        "start": bookDate
      }, endPoint: '/api/members/book');
      if (res['message'] == "success") {
        // log(res.toString());
        return right(null);
      } else {
        // log(res['message']);
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
