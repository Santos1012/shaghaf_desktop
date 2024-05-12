import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/new_book/presentation/views/new_book_view.dart';
import 'package:saghaf_desktop/features/side_bar/presentation/manager/side_bar_cubit.dart';
import 'package:saghaf_desktop/features/side_bar/presentation/views/widgets/side_bar_body.dart';
import 'package:saghaf_desktop/features/splash/presentations/views/splash_view.dart';

class SideBarView extends StatelessWidget {
  const SideBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: BlocProvider(
          create: (context) => SideBarCubit(),
          child: const SideBarBody(),
        ));
  }
}
