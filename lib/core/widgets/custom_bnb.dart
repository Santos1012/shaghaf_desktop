import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/current_reservation_view.dart';
import 'package:saghaf_desktop/features/new_book/presentation/views/new_book_view.dart';
import 'package:saghaf_desktop/features/requests/presentation/views/requests_view.dart';

import '../utils/imports.dart';

class CustomBNB extends StatefulWidget {
  const CustomBNB({super.key});

  @override
  State<CustomBNB> createState() => _CustomBNBState();
}

class _CustomBNBState extends State<CustomBNB> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const NewBookView(),
      const CurrentReservationView(),
      const RequestsView()
    ];
    List icons = [
      Icons.add,
      Icons.people_alt,
      Icons.request_page,
    ];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          color: const Color(0xFF2E2E2F),
          width: double.infinity,
          height: 64.h(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        color: (currentIndex == index)
                            ? const Color(0xFFFFCC0A)
                            : Colors.white,
                      ),
                      (currentIndex == index)
                          ? Container(
                              width: 21.w(context),
                              height: 10.h(context),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFCC0A),
                                borderRadius:
                                    BorderRadius.circular(20.w(context)),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
