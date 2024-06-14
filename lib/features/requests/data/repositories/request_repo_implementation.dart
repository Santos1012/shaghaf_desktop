import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:saghaf_desktop/core/api_service.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/requests/data/models/request_model.dart';
import 'package:saghaf_desktop/features/requests/data/repositories/request_repo.dart';

class RequestRepoImplementation extends RequestRepo {
  final ApiService apiService;

  RequestRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, RequestModel>> getAllMembers({required int page,}) async {
    try {
      final res = await apiService.getData(
          endPoint: '/api/members/book?$page=1&limit=10');
      if (res['message'] == "success") {
        return right(
          RequestModel.fromJson(res),
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
