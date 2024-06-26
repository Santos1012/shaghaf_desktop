import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/data/repositories/get_reservations_implementation.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/add_items_cubit/add_items_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/end_reservation_cubit/end_reservation_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/reservations_cubit/current_reservation_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/current_reservation_body.dart';
import '../../../../core/service_locator.dart';

class CurrentReservationView extends StatelessWidget {
  const CurrentReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return CurrentReservationCubit(
                gitIt<CurrentReservationRepoImplementation>())
              ..getRoomsReservations();
          },
        ),
        BlocProvider(
          create: (context) {
            return AddItemsCubit(gitIt<CurrentReservationRepoImplementation>());
          },
        ),
        BlocProvider(
          create: (context) {
            return EndReservationCubit(
                gitIt<CurrentReservationRepoImplementation>());
          },
        ),
        BlocProvider(
          create: (context) {
            return GetProductCubit(
                gitIt<CurrentReservationRepoImplementation>())
              ..getProducts();
          },
        ),
      ],
      child: Padding(
          padding: EdgeInsets.only(
            bottom: 15.w(context),
            right: 15.w(context),
            left: 15.w(context),
          ),
          child: const CurrentReservationBody()),
    );
  }
}
