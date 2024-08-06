import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_repo.dart';
part 'add_items_state.dart';

class AddItemsCubit extends Cubit<AddItemsState> {
  AddItemsCubit(this.currentReservationRepo) : super(AddItemsInitial());
  final CurrentReservationRepo currentReservationRepo;
  int pageNumber = 1;
  DateTime? x;

  Future<void> addItemToUser({
    required List product,
    required String reservationId,
  }) async {
    emit(AddItemsLoading());
    final result = await currentReservationRepo.addCoffee(
       product: product, userId: reservationId);

    result.fold(
      (l) {
        log(l.errorMessage);
        emit(AddItemsFailure(l.errorMessage));
      },
      (r) {
        log("success");
        emit(AddItemsSuccess());
      },
    );
  }
}
