// import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/reservations_cubit/current_reservation_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/add_items_body.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/list_row.dart';

import '../../../../../core/widgets/loading_widget.dart';

class CurrentReservationBody extends StatefulWidget {
  const CurrentReservationBody({super.key});

  @override
  State<CurrentReservationBody> createState() => _CurrentReservationBodyState();
}

class _CurrentReservationBodyState extends State<CurrentReservationBody> {
  bool isTapped = false;

  int selectedIndex = -1;
  DateTime a = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentReservationCubit, CurrentReservationState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                width: Platform.isWindows
                    ? MediaQuery.of(context).size.width * 1 / 3
                    : double.infinity,
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
                width: Platform.isWindows
                    ? MediaQuery.of(context).size.width * 5 / 6
                    : double.infinity,
                color: Colors.grey.withOpacity(0.1),
                child: Container(
                  height: 80.h(context),
                  color: Colors.grey.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          state is CurrentReservationSuccess
                              ? "1/1"
                              // ? "${BlocProvider.of<CurrentReservationCubit>(context).pageNumber}/${state.getUsersList!.pagination!.totalPages}"
                              : "1/1",
                          style: TextStyle(
                              fontSize: 20.w(context),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Comfortaa",
                              color: const Color(0xFF6E6E6E)),
                        ),
                        SizedBoxApp(
                          w: 20.w(context),
                        ),
                        IconButton(
                          onPressed: () {
                            // if (BlocProvider.of<GetUsersCubit>(context)
                            //         .pageNumber >
                            //     1) {
                            //   BlocProvider.of<GetUsersCubit>(context)
                            //       .getAllUsersPagination(add: false);
                            // }
                          },
                          padding: EdgeInsets.only(left: 10.w(context)),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30.w(context),
                          ),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color:
                                      const Color(0xFF20473E).withOpacity(0.75),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBoxApp(
                          w: 20.w(context),
                        ),
                        IconButton(
                          onPressed: () {
                            // if (state is CurrentReservationSuccess) {
                            //   if (state.getUsersList!.pagination!.totalPages! >
                            //       BlocProvider.of<GetUsersCubit>(context)
                            //           .pageNumber) {
                            //     {
                            //       BlocProvider.of<GetUsersCubit>(context)
                            //           .getAllUsersPagination(add: true);
                            //     }
                            //   }
                            // }
                          },
                          icon: Icon(Icons.arrow_forward_ios,
                              size: 30.w(context)),
                          padding: EdgeInsets.only(right: 3.w(context)),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color:
                                      const Color(0xFF20473E).withOpacity(0.75),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBoxApp(
                          w: 20.w(context),
                        ),
                        Text(
                          "Go to",
                          style: TextStyle(
                              fontSize: 20.w(context),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Comfortaa",
                              color: const Color(0xFF6E6E6E)),
                        ),
                        SizedBoxApp(
                          w: 20.w(context),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w(context),
                              vertical: 10.h(context),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    const Color(0xFF20473E).withOpacity(0.75),
                              ),
                            ),
                            child: Center(
                                child: Text(
                                    state is CurrentReservationSuccess
                                        // ? "${state.getUsersList!.pagination!.totalPages!} page"
                                        ? "1 page"
                                        : "1 page",
                                    style: TextStyle(
                                      fontSize: 20.w(context),
                                      color: const Color(0xFF6E6E6E),
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
              const Divider(),
              if (state is CurrentReservationLoading) ...[
                Container(
                  width: Platform.isWindows
                      ? MediaQuery.of(context).size.width * 5 / 6
                      : double.infinity,
                  color: Colors.grey.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * .07,
                  child: const LoadingWidget(),
                ),
              ],
              if (state is CurrentReservationSuccess) ...[
                SizedBox(
                  width: Platform.isWindows
                      ? MediaQuery.of(context).size.width * 5 / 6
                      : double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.getReservationsList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      int? userIndex = state.getUsersList?.data!.indexWhere(
                          (element) =>
                              element.id ==
                              state.getReservationsList[index].user?.id);
                      DateTime x = DateTime.parse(state
                          .getReservationsList[index].startDate
                          .toString());
                      DateTime a = DateTime.parse(
                          state.getReservationsList[index].endDate.toString());
                      // int hTimer = DateTime.now().hour - x.hour;
                      // a = DateTime.now().subtract(Duration(
                      //     days: x.day,
                      //     hours: x.hour,
                      //     minutes: x.minute,
                      //     seconds: x.second));
                      // a.add(const Duration(seconds: 1));
                      // int mTimer = DateTime.now().minute - x.minute;
                      // log(a.toString());
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
                              text0: (userIndex ?? -1) >= 0
                                  ? (state.getReservationsList[index].user
                                          ?.username ??
                                      "")
                                  : state.getReservationsList[index].user
                                          ?.username
                                          ?.toString() ??
                                      "Not available",
                              text1: (userIndex ?? -1) >= 0
                                  ? (state.getUsersList?.data?[userIndex!]
                                          .phone ??
                                      "")
                                  : state.getReservationsList[index].user?.email
                                          ?.toString() ??
                                      "Not available",
                              text2: "${x.year}-${x.month}-${x.day}",
                              // state.getReservationsList[index].start!
                              //     .toIso8601String()
                              //     .substring(
                              //         0,
                              //         state.getReservationsList[index].start!
                              //             .toIso8601String()
                              //             .indexOf("T")),
                              text3: "${x.hour}:${x.minute}:${x.second}",
                              text4: "${a.hour}:${a.minute}:${a.second}",
                              //  state.getReservationsList[index].start!
                              //     .toIso8601String()
                              //     .substring(11, 19),
                              // text4: "${a.hour}h ${a.minute}m ${a.second}s",
                              text5: state
                                      .getReservationsList[index].room?.title
                                      ?.toString() ??
                                  "Not available",
                              text6: state.getReservationsList[index]
                                          .reservationPaid ==
                                      false
                                  ? "Close"
                                  : "Open",
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
                                }, userReservation: state.getReservationsList[index],
                              ),
                            ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
