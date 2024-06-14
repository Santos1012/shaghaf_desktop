import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';
import 'package:saghaf_desktop/features/new_book/presentation/manager/get_users_cubit.dart';
import 'package:saghaf_desktop/features/new_book/presentation/views/add_user_view.dart';

import '../../../../side_bar/presentation/manager/side_bar_cubit.dart';

class NewBookBody extends StatefulWidget {
  const NewBookBody({super.key});

  @override
  State<NewBookBody> createState() => _NewBookBodyState();
}

class _NewBookBodyState extends State<NewBookBody> {
  DateTime selectedDateTime = DateTime.now();
  String? userId = "";
  @override
  Widget build(BuildContext context) {
    // final List<String> items = [
    //   'smoking room',
    //   'gaming room',
    //   'edu room',
    //   'other'
    // ];
    // final List<String> place = [
    //   'Roxy',
    //   'Masr Elgededa’',
    // ];
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController searchPhoneController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController placeController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 62.h(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Open New Booking",
            style: TextStyle(
              fontSize: 32.w(context),
              fontWeight: FontWeight.w700,
              fontFamily: "Comfortaa",
            ),
          ),
          SizedBox(
            height: 46.h(context),
          ),
          Text(
            "Select User by Phone number",
            style: TextStyle(
                fontSize: 24.w(context),
                fontWeight: FontWeight.w500,
                fontFamily: "Comfortaa"),
          ),
          SizedBox(
            height: 32.h(context),
          ),
          BlocConsumer<GetUsersCubit, GetUsersState>(
            listener: (context, state) {},
            buildWhen: (previous, current) => current is GetUsersSuccess,
            builder: (context, state) {
              if (state is GetUsersSuccess) {
                return Row(
                  children: [
                    DropdownMenu(
                      onSelected: (value) {
                        userId = value!.id;
                        nameController.text = value.username ?? "";
                        phoneController.text = value.phone ?? "";
                        final currentTime = DateTime.now();
                        dateController.text =
                            "${currentTime.day.toString()}/${currentTime.month.toString()}/${currentTime.year.toString()}";
                        final hour = (currentTime.hour < 10)
                            ? '0${currentTime.hour}'
                            : '${currentTime.hour}';
                        final minute = (currentTime.minute < 10)
                            ? '0${currentTime.minute}'
                            : '${currentTime.minute}';
                        final period = (currentTime.hour < 12) ? 'AM' : 'PM';
                        final timeString = '$hour:$minute $period';
                        timeController.text = timeString;
                        selectedDateTime = DateTime.now();
                        log(value.toString());
                      },
                      dropdownMenuEntries: List.generate(
                          state.getUsersModel.data!.length, (index) {
                        return DropdownMenuEntry(
                          label:
                              state.getUsersModel.data![index].phone.toString(),
                          value: state.getUsersModel.data![index],
                        );
                      }),
                      width: 650.w(context),
                      enableFilter: true,
                      controller: searchPhoneController,
                    ),
                    SizedBox(
                      width: 20.w(context),
                    ),
                    MaterialButton(
                        height: 54.h(context),
                        onPressed: () {
                          if (!List.generate(
                            state.getUsersModel.data!.length,
                            (index) {
                              return state.getUsersModel.data![index].phone
                                  .toString();
                            },
                          ).contains(searchPhoneController.text)) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AddUserView(),
                              ),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.w(context))),
                        color: const Color(0xFF838383),
                        child: const Text(
                          "Add User",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Comfortaa"),
                        )),
                  ],
                );
              }
              if (state is GetUsersLoading) {
                return const Center(child: CircularProgressIndicator(color: Colors.grey,));
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: 46.h(context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AppCustomTextField(
                  hint: "Enter full Name",
                  textName: "Full Name",
                  controller: nameController,
                ),
              ),
              SizedBox(
                width: 20.w(context),
              ),
              Expanded(
                child: AppCustomTextField(
                  phone: true,
                  hint: "Enter Phone Number",
                  textName: "Phone Number",
                  controller: phoneController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48.h(context),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: Platform.isWindows ? 415.w(context) : 0),
            child: Row(
              children: [
                Expanded(
                  child: AppCustomTextField(
                    hint: "dd/mm/yy",
                    textName: "Date",
                    controller: dateController,
                    readOnly: true,
                    onTap: () {
                      dateController.text =
                          "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";
                    },
                  ),
                ),
                SizedBox(
                  width: 20.w(context),
                ),
                Expanded(
                  child: AppCustomTextField(
                    hint: "hh:mm",
                    textName: "Time",
                    controller: timeController,
                    readOnly: true,
                    onTap: () {
                      final currentTime = DateTime.now();
                      final hour = (currentTime.hour < 10)
                          ? '0${currentTime.hour}'
                          : '${currentTime.hour}';
                      final minute = (currentTime.minute < 10)
                          ? '0${currentTime.minute}'
                          : '${currentTime.minute}';
                      final period = (currentTime.hour < 12) ? 'AM' : 'PM';
                      final timeString = '$hour:$minute $period';
                      timeController.text = timeString;
                      selectedDateTime = DateTime.now();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 46.h(context),
          ),
          // Padding(
          //   padding:
          //       EdgeInsets.only(right: Platform.isWindows ? 415.w(context) : 0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "Room",
          //             style: TextStyle(
          //                 fontSize: 24.w(context),
          //                 fontWeight: FontWeight.w500,
          //                 fontFamily: "Comfortaa"),
          //           ),
          //           SizedBoxApp(
          //             h: 30.h(context),
          //           ),
          //           CustomDropdown<String>(
          //             closedHeaderPadding: EdgeInsets.symmetric(
          //                 horizontal: 12.w(context), vertical: 18.h(context)),
          //             hintText: 'add item',
          //             headerBuilder: (context, selectedItem) {
          //               return Text(
          //                 selectedItem,
          //               );
          //             },
          //             items: items,
          //             initialItem: items[0],
          //             decoration: CustomDropdownDecoration(
          //               closedBorder: Border.all(
          //                   color: const Color(0xFFB1B1B1), width: 1),
          //               expandedBorder: Border.all(
          //                   color: const Color(0xFFB1B1B1), width: 1),
          //             ),
          //             onChanged: (value) {},
          //           )
          //         ],
          //       )),
          //       SizedBox(
          //         width: 20.w(context),
          //       ),
          //       Expanded(
          //           child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "Place",
          //             style: TextStyle(
          //                 fontSize: 24.w(context),
          //                 fontWeight: FontWeight.w500,
          //                 fontFamily: "Comfortaa"),
          //           ),
          //           SizedBoxApp(
          //             h: 30.h(context),
          //           ),
          //           CustomDropdown<String>(
          //             closedHeaderPadding: EdgeInsets.symmetric(
          //                 horizontal: 12.w(context), vertical: 18.h(context)),
          //             hintText: 'add item',
          //             headerBuilder: (context, selectedItem) {
          //               return Text(
          //                 selectedItem,
          //               );
          //             },
          //             items: place,
          //             initialItem: place[0],
          //             decoration: CustomDropdownDecoration(
          //               closedBorder: Border.all(
          //                   color: const Color(0xFFB1B1B1), width: 1),
          //               expandedBorder: Border.all(
          //                   color: const Color(0xFFB1B1B1), width: 1),
          //             ),
          //             onChanged: (value) {},
          //           )
          //         ],
          //       )),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 46.h(context),
          // ),
          Padding(
            padding:
                EdgeInsets.only(right: Platform.isWindows ? 730.w(context) : 0),
            child: Row(children: [
              Expanded(
                child: BlocConsumer<GetUsersCubit, GetUsersState>(
                  listener: (context, state) {
                    if (state is UserBookSuccess) {
                      context.read<SideBarCubit>().changeIndex(1);
                      setState(() {});
                    }
                  },
                  builder: (context, state) {
                    if (state is UserBookLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.grey,));
                    } else if (state is UserBookError) {
                      return Column(
                        children: [
                          MaterialButton(
                              height: 54.h(context),
                              onPressed: () {
                                context.read<GetUsersCubit>().userBook(
                                    userId: userId ?? "",
                                    bookDate: selectedDateTime.toString());
                                if (state is UserBookSuccess) {
                                  context.read<SideBarCubit>().changeIndex(1);
                                  setState(() {});
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.w(context))),
                              color: const Color(0xFF20473F),
                              child: const Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Comfortaa"),
                              )),
                          Text(state.errorMessage),
                        ],
                      );
                    }
                    return MaterialButton(
                        height: 54.h(context),
                        onPressed: () {
                          context.read<GetUsersCubit>().userBook(
                              userId: userId ?? "",
                              bookDate: selectedDateTime.toString());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.w(context))),
                        color: const Color(0xFF20473F),
                        child: const Text(
                          "Done",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Comfortaa"),
                        ));
                  },
                ),
              ),
              SizedBox(
                width: 20.w(context),
              ),
              Expanded(
                child: MaterialButton(
                    height: 54.h(context),
                    onPressed: () {
                      nameController.clear();
                      phoneController.clear();
                      dateController.clear();
                      timeController.clear();
                      priceController.clear();
                      placeController.clear();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w(context))),
                    color: const Color(0xFF838383),
                    child: const Text(
                      "Clear All",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Comfortaa"),
                    )),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
