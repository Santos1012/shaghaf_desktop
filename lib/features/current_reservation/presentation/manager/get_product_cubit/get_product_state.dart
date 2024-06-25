part of 'get_product_cubit.dart';

sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductSuccess extends GetProductState {
  // final List<ReservationsModel> getReservationsList;
  final List<ProductsModel> productsList;
  GetProductSuccess(this.productsList);
}

final class GetProductError extends GetProductState {
  final String errorMessage;
  GetProductError(this.errorMessage);
}
