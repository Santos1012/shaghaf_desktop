import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/imports.dart';

part 'side_bar_state.dart';

class SideBarCubit extends Cubit<SideBarState> {
  SideBarCubit() : super(SideBarInitial());
  int index = 0;

  void changeIndex(int newIndex) {
    index = newIndex;
    emit(SideBarInitial());
  }
}
