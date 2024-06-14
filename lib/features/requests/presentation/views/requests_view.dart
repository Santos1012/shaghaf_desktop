import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/service_locator.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/requests/data/repositories/request_repo_implementation.dart';
import 'package:saghaf_desktop/features/requests/presentation/manager/request_cubit.dart';
import 'package:saghaf_desktop/features/requests/presentation/views/widgets/requests_body.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RequestCubit(sl<RequestRepoImplementation>())..getAllMembers(),
      child: Padding(
          padding: EdgeInsets.only(
            bottom: 15.w(context),
            right: 15.w(context),
            left: 15.w(context),
          ),
          child: const RequestsBody()),
    );
  }
}
