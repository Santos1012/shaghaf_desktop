import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/products_model.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_repo.dart';
part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.currentReservationRepo) : super(GetProductInitial());
  final CurrentReservationRepo currentReservationRepo;
  int pageNumber = 1;
  DateTime? x;

  Future<void> getProducts() async {
    emit(GetProductLoading());
    final result =
        await currentReservationRepo.getAllProduct(page: 1, limit: 100);

    result.fold(
      (l) {
        log(l.errorMessage);
        emit(GetProductError(l.errorMessage));
      },
      (r) {
        emit(GetProductSuccess(r));
        log(r.length.toString());
      },
    );
  }
}
