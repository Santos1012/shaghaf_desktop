import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/current_reservation_body.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo_implementation.dart';
import 'package:saghaf_desktop/features/new_book/presentation/manager/get_users_cubit.dart';

import '../../../../core/service_locator.dart';

class CurrentReservationView extends StatelessWidget {
  const CurrentReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider(
          create: (context) {
            return GetUsersCubit(sl<GetUsersRepoImplementation>())
              ..getReservations();
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
