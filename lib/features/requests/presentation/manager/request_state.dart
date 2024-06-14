part of 'request_cubit.dart';

sealed class RequestState {}

final class RequestInitial extends RequestState {}

final class RequestLoading extends RequestState {}

final class RequestSuccess extends RequestState {
  final RequestModel requestModel;
  RequestSuccess(this.requestModel);
}

final class RequestError extends RequestState {
  final String errorMessage;
  RequestError(this.errorMessage);
}
