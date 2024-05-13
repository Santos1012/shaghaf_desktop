import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/features/side_bar/presentation/manager/side_bar_cubit.dart';
import 'package:saghaf_desktop/features/side_bar/presentation/views/widgets/side_bar_body.dart';

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
