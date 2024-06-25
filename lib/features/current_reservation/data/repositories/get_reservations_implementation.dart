// import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:saghaf_desktop/core/api_service.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/products_model.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/room_reservations_models/room_reservations_models.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_repo.dart';
import 'package:saghaf_desktop/core/models/get_users_model.dart';
// import 'package:saghaf_desktop/features/current_reservation/data/models/reservations_model/reservations_model.dart';

class CurrentReservationRepoImplementation extends CurrentReservationRepo {
  final ApiService apiService;

  CurrentReservationRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, GetUsersModel>> getAllUsers(
      {required int page, required int limit, required String userType}) async {
    try {
      final res = await apiService.getData(
          endPoint: '/api/users?userType=$userType&page=$page&limit=$limit');
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
  Future<Either<Failures, List<RoomReservationsModels>>>
      getAllRoomsReservations() async {
    List<RoomReservationsModels> resList = [];
    try {
      final res =
          await apiService.getData(endPoint: '/api/rooms/book?limit=100');
      if (res['message'] == "success") {
        for (var element in res["data"]) {
          resList.add(RoomReservationsModels.fromJson(element));
        }
        // log(resList.toString());
        resList.sort(
          (a, b) => a.startDate!.compareTo(b.startDate!),
        );
        resList.removeWhere(
          (element) => element.reservationPaid ?? true == true,
        );
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
  Future<Either<Failures, List<ProductsModel>>> getAllProduct(
      {required int page, required int limit}) async {
    List<ProductsModel> productsList = [];
    try {
      final res =
          await apiService.getData(endPoint: '/api/products?limit=$limit');
      if (res['message'] == "success") {
        for (var element in res["data"]) {
          productsList.add(ProductsModel.fromJson(element));
        }
        return right(
          productsList,
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
  Future<Either<Failures, void>> addCoffee({
    required String productId,
    required String userId,
    required int count,
  }) async {
    try {
      final res = await apiService.putData(data: {
        "coffee": [
          {"product": productId, "count": count}
        ]
      }, endPoint: '/api/rooms/book/$userId/stuff');
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
