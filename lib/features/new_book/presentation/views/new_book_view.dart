import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/service_locator.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo_implementation.dart';
import 'package:saghaf_desktop/features/new_book/presentation/manager/get_users_cubit.dart';

class NewBookView extends StatelessWidget {
  const NewBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUsersCubit>(
          create: (context) =>
              GetUsersCubit(sl<GetUsersRepoImplementation>())..getAllRooms(),
        ),
        BlocProvider<CreateUsersCubit>(
          create: (context) =>
              CreateUsersCubit(sl<GetUsersRepoImplementation>()),
        ),
      ],
      child: const SafeArea(
        child: Scaffold(
          body: NewBookBody(),
        ),
      ),
    );
  }
}
