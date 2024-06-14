import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/requests/data/models/request_model.dart';
import 'package:saghaf_desktop/features/requests/data/repositories/request_repo.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit(this.requestRepo) : super(RequestInitial());
  final RequestRepo requestRepo;

  Future<void> getAllMembers() async {
    emit(RequestLoading());
    final result = await requestRepo.getAllMembers(page:1);
    result.fold(
      (l) {
        log(l.errorMessage);
        emit(RequestError(l.errorMessage));
      },
      (r) {
        log(r.message.toString());
        emit(RequestSuccess(r));
      },
    );
  }
}
