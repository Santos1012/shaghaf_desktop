import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:saghaf_desktop/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_implementation.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo_implementation.dart';
import 'package:saghaf_desktop/features/requests/data/repositories/request_repo_implementation.dart';
import 'api_service.dart';

final gitIt = GetIt.instance;

class ServiceLocator {
  void init() {
    gitIt.registerSingleton<ApiService>(ApiService(Dio()));
    gitIt.registerSingleton<AuthRepoImplementation>(
        AuthRepoImplementation(gitIt()));
    gitIt.registerSingleton<RequestRepoImplementation>(
        RequestRepoImplementation(gitIt()));
    gitIt.registerSingleton<GetUsersRepoImplementation>(
        GetUsersRepoImplementation(gitIt()));
    gitIt.registerSingleton<CurrentReservationRepoImplementation>(
        CurrentReservationRepoImplementation(gitIt()));
  }
}
