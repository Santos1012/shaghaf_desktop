import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:saghaf_desktop/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo_implementation.dart';
import 'package:saghaf_desktop/features/requests/data/repositories/request_repo_implementation.dart';
import 'api_service.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<ApiService>(ApiService(Dio()));
    sl.registerSingleton<AuthRepoImplementation>(AuthRepoImplementation(sl()));
    sl.registerSingleton<RequestRepoImplementation>(
        RequestRepoImplementation(sl()));
    sl.registerSingleton<GetUsersRepoImplementation>(
        GetUsersRepoImplementation(sl()));
  }
}
