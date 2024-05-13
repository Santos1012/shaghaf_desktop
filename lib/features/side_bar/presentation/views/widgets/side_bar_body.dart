import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/auth/presentation/views/login_view.dart';
import 'package:saghaf_desktop/features/new_book/presentation/views/new_book_view.dart';
import 'package:saghaf_desktop/features/side_bar/presentation/manager/side_bar_cubit.dart';
import 'package:saghaf_desktop/features/splash/presentations/views/splash_view.dart';

class SideBarBody extends StatelessWidget {
  const SideBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    SidebarXController controller = SidebarXController(selectedIndex: 0);
    List<Widget> screens = [
      const NewBookView(),
      const SplashView(),
      const LoginView()
    ];
    return BlocBuilder<SideBarCubit, SideBarState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<SideBarCubit>(context);
        return Row(
          children: [
            SidebarX(
              controller: controller,
              extendIcon: Icons.arrow_forward_ios_rounded,
              theme: SidebarXTheme(
                decoration: const BoxDecoration(
                  color: Color(0xFFFCF7F7),
                ),
                width: 50,
                textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                selectedTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                selectedItemTextPadding: EdgeInsets.only(left: 30.w(context)),
                itemTextPadding: EdgeInsets.only(left: 30.w(context)),
                selectedItemDecoration: BoxDecoration(
                  color: const Color(0xFF20473F).withOpacity(0.26),
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 20.w(context),
                ),
                selectedIconTheme: const IconThemeData(
                  color: Colors.black,
                  size: 20,
                ),
              ),
              extendedTheme: SidebarXTheme(
                width: 290.w(context),
                decoration: const BoxDecoration(
                  color: Color(0xFFFCF7F7),
                ),
              ),
              headerBuilder: (context, extended) {
                return SizedBox(
                    height: 141.h(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset("assets/shaghaf_logo.png"),
                    ));
              },
              items: [
                SidebarXItem(
                  icon: Icons.add,
                  iconBuilder: (selected, hovered) {
                    return const Icon(
                      Icons.add,
                      color: Colors.black,
                    );
                  },
                  label: 'Open New Booking',
                  onTap: () {
                    cubit.changeIndex(0);
                  },
                ),
                SidebarXItem(
                  icon: Icons.people_alt,
                  onTap: () {
                    cubit.changeIndex(1);
                  },
                  iconBuilder: (selected, hovered) {
                    return const Icon(
                      Icons.people_alt,
                      color: Colors.black,
                    );
                  },
                  label: 'Current reservations',
                ),
                SidebarXItem(
                  icon: Icons.people,
                  onTap: () {
                    cubit.changeIndex(2);
                  },
                  iconBuilder: (selected, hovered) {
                    return const Icon(
                      Icons.request_page,
                      color: Colors.black,
                    );
                  },
                  label: 'Requests ',
                ),
              ],
            ),
            Expanded(child: screens[cubit.index]),
          ],
        );
      },
    );
  }
}
