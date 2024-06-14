import 'package:dartz/dartz.dart';
import 'package:saghaf_desktop/core/errors/failure.dart';
import 'package:saghaf_desktop/features/requests/data/models/request_model.dart';

abstract class RequestRepo {
  RequestRepo();
  Future<Either<Failures, RequestModel>> getAllMembers({required int page});
}
