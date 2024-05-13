import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/add_items_body.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/list_row.dart';

class CurrentReservationBody extends StatefulWidget {
  const CurrentReservationBody({super.key});

  @override
  State<CurrentReservationBody> createState() => _CurrentReservationBodyState();
}

class _CurrentReservationBodyState extends State<CurrentReservationBody> {
  bool isTapped = false;

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBoxApp(
            h: 80.h(context),
          ),
          Text(
            "Current reservations",
            style: TextStyle(
              fontSize: 32.w(context),
              fontWeight: FontWeight.w700,
              fontFamily: "Comfortaa",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1 / 3,
            child: AppCustomTextField(
              hint: "Search",
              textName: "",
              controller: TextEditingController(),
              isSearch: true,
            ),
          ),
          SizedBoxApp(
            h: 40.h(context),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 5 / 6,
            color: Colors.grey.withOpacity(0.1),
            child: Container(
              height: 80.h(context),
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        width: 180.w(context),
                        height: 50.h(context),
                        decoration: BoxDecoration(
                          color: const Color(0xFF20473E).withOpacity(0.75),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text("New Entry",
                                style: TextStyle(
                                  fontSize: 20.w(context),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Comfortaa",
                                ))))
                  ],
                ),
              ),
            ),
          ),
          ListRow(
            text0: "Name",
            text1: "Phone",
            text2: "Date",
            text3: 'Time',
            text4: "Timer",
            text5: "Method",
            text6: "Action",
            color: Colors.grey.withOpacity(0.1),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 5 / 6,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (selectedIndex != index) {
                          isTapped = true;
                          selectedIndex = index;
                        } else {
                          isTapped = false;
                          selectedIndex = -1;
                        }
                        setState(() {});
                      },
                      child: ListRow(
                        text0: "Ahmed",
                        text1: "0123456789",
                        text2: "2/5/2024",
                        text3: '5:00 pm',
                        text4: "3 hours",
                        text5: "App",
                        text6: "Close",
                        isAction: true,
                        color: isTapped && (selectedIndex == index)
                            ? const Color(0xFF94B2FF)
                            : Colors.grey.withOpacity(0.1),
                      ),
                    ),
                    if (isTapped && selectedIndex == index)
                      Container(
                        color: Colors.grey.withOpacity(0.3),
                        height: 350.h(context),
                        child: AddItemsBody(
                          onTap: () {
                            if (selectedIndex != index) {
                              isTapped = true;
                              selectedIndex = index;
                            } else {
                              isTapped = false;
                              selectedIndex = -1;
                            }
                            setState(() {});
                          },
                        ),
                      )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
