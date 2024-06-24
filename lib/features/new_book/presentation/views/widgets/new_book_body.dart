import 'dart:developer';
import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';
import 'package:saghaf_desktop/core/widgets/loading_widget.dart';
import 'package:saghaf_desktop/features/new_book/data/models/rooms_models/plan.dart';

import 'package:saghaf_desktop/features/new_book/data/models/rooms_models/rooms_models.dart';
import 'package:saghaf_desktop/features/new_book/presentation/manager/get_users_cubit.dart';
import 'package:saghaf_desktop/features/new_book/presentation/views/add_user_view.dart';

import '../../../../../core/models/get_users_model.dart';
import '../../../../side_bar/presentation/manager/side_bar_cubit.dart';

class NewBookBody extends StatefulWidget {
  const NewBookBody({super.key});

  @override
  State<NewBookBody> createState() => _NewBookBodyState();
}

class _NewBookBodyState extends State<NewBookBody> {
  List<RoomPlan> plan = [RoomPlan(price: 22, stamp: "null")];
  String? userId = "";
  RoomsModels? selectedRoom;
  RoomPlan? selectedPlan;
  int selectedNumber = 1;
  DateTime selectedDateTime = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController searchPhoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController roomIdController = TextEditingController();
  TextEditingController planIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Expanded(
                child: Text(
                  "Select User by Phone number",
                  style: TextStyle(
                      fontSize: 24.w(context),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Comfortaa"),
                ),
              ),
              Expanded(
                child: Text(
                  "Select Num of booking time",
                  style: TextStyle(
                      fontSize: 24.w(context),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Comfortaa"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h(context),
          ),
          BlocConsumer<GetUsersCubit, GetUsersState>(
            listener: (context, state) {},
            // buildWhen: (previous, current) => current is GetUsersSuccess,
            builder: (context, state) {
              if (state is GetRoomsSuccess) {
                List<int> numbers = [
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                  11,
                  12,
                  13,
                  14,
                  15,
                  16,
                  17,
                  18,
                  19,
                  20,
                  21,
                  22,
                  23,
                  24,
                  25,
                  26,
                  27,
                  28,
                  29,
                  30,
                ];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          DropdownMenu<DatumGetAllUsers>(
                            enableFilter: true,
                            enableSearch: true,
                            hintText: "select user",
                            helperText:
                                "if you don't found user try to create one",
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
                              final period =
                                  (currentTime.hour < 12) ? 'AM' : 'PM';
                              final timeString = '$hour:$minute $period';
                              timeController.text = timeString;
                              selectedDateTime = DateTime.now();
                              log(value.toString());
                            },
                            dropdownMenuEntries: List.generate(
                                state.getUsersModel.data!.length, (index) {
                              return DropdownMenuEntry(
                                label: state.getUsersModel.data![index].phone
                                    .toString(),
                                value: state.getUsersModel.data![index],
                              );
                            }),
                            width: 650.w(context),
                            controller: searchPhoneController,
                          ),
                          SizedBox(
                            height: 20.w(context),
                          ),
                          MaterialButton(
                              height: 54.h(context),
                              onPressed: () {
                                if (!List.generate(
                                  state.getUsersModel.data!.length,
                                  (index) {
                                    return state
                                        .getUsersModel.data![index].phone
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
                                  borderRadius:
                                      BorderRadius.circular(10.w(context))),
                              color: const Color(0xFF838383),
                              child: const Text(
                                "Add User",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Comfortaa"),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w(context),
                    ),
                    Expanded(
                      child: DropdownMenu<int>(
                        menuHeight: 200.h(context),
                        enableFilter: true,
                        enableSearch: true,
                        hintText: "select hours'number",
                        onSelected: (value) {
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
                          selectedNumber = value ?? 1;
                          setState(() {});
                          log(value.toString());
                        },
                        dropdownMenuEntries:
                            List.generate(numbers.length, (index) {
                          return DropdownMenuEntry(
                            label: numbers[index].toString(),
                            value: numbers[index],
                          );
                        }),
                        width: 650.w(context),
                      ),
                    ),
                  ],
                );
              }
              if (state is GetRoomsLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                ));
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: 20.w(context),
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
            height: 20.h(context),
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
            height: 20.h(context),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: Platform.isWindows ? 415.w(context) : 0),
            child: BlocConsumer<GetUsersCubit, GetUsersState>(
                listener: (context, state) {},
                // buildWhen: (previous, current) => current is get,
                builder: (context, state) {
                  if (state is GetRoomsSuccess) {
                    return Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Room",
                                  style: TextStyle(
                                      fontSize: 24.w(context),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Comfortaa"),
                                ),
                                SizedBox(width: 12.w(context)),
                                Text(
                                  selectedRoom?.type ?? "Type",
                                  style: TextStyle(
                                      fontSize: 12.w(context),
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Comfortaa"),
                                ),
                              ],
                            ),
                            SizedBoxApp(
                              h: 30.h(context),
                            ),
                            DropdownMenu<RoomsModels>(
                              onSelected: (value) {
                                selectedRoom = value;
                                final currentTime = DateTime.now();
                                dateController.text =
                                    "${currentTime.day.toString()}/${currentTime.month.toString()}/${currentTime.year.toString()}";
                                final hour = (currentTime.hour < 10)
                                    ? '0${currentTime.hour}'
                                    : '${currentTime.hour}';
                                final minute = (currentTime.minute < 10)
                                    ? '0${currentTime.minute + 5}'
                                    : '${currentTime.minute + 5}';
                                final period =
                                    (currentTime.hour < 12) ? 'AM' : 'PM';
                                final timeString = '$hour:$minute $period';
                                timeController.text = timeString;
                                selectedDateTime = DateTime.now();
                                plan = value?.plans ?? [];
                                selectedPlan = null;
                                setState(() {});
                                log(value.toString());
                              },
                              dropdownMenuEntries: List.generate(
                                  state.roomsModel.length, (index) {
                                return DropdownMenuEntry(
                                  label:
                                      state.roomsModel[index].title.toString(),
                                  value: state.roomsModel[index],
                                );
                              }),
                              width: 650.w(context),
                              enableFilter: true,
                              enableSearch: true,
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 20.w(context),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Plans",
                                  style: TextStyle(
                                      fontSize: 24.w(context),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Comfortaa"),
                                ),
                                SizedBox(width: 12.w(context)),
                                Text(
                                  key: ValueKey(selectedPlan),
                                  selectedPlan?.stamp ?? "Type",
                                  style: TextStyle(
                                      fontSize: 12.w(context),
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Comfortaa"),
                                ),
                              ],
                            ),
                            SizedBoxApp(
                              h: 30.h(context),
                            ),
                            DropdownMenu<RoomPlan>(
                              key: ValueKey(selectedPlan),
                              onSelected: (value) {
                                final currentTime = DateTime.now();
                                dateController.text =
                                    "${currentTime.day.toString()}/${currentTime.month.toString()}/${currentTime.year.toString()}";
                                final hour = (currentTime.hour < 10)
                                    ? '0${currentTime.hour}'
                                    : '${currentTime.hour}';
                                final minute = (currentTime.minute < 10)
                                    ? '0${currentTime.minute + 5}'
                                    : '${currentTime.minute + 5}';
                                final period =
                                    (currentTime.hour < 12) ? 'AM' : 'PM';
                                final timeString = '$hour:$minute $period';
                                timeController.text = timeString;
                                selectedDateTime = DateTime.now();
                                selectedPlan = value;
                                setState(() {});
                                log(value.toString());
                              },
                              dropdownMenuEntries:
                                  List.generate(plan.length, (index) {
                                return DropdownMenuEntry(
                                  label: plan[index].stamp.toString(),
                                  value: plan[index],
                                );
                              }),
                              width: 650.w(context),
                              enableFilter: true,
                              enableSearch: true,
                            ),
                          ],
                        )),
                      ],
                    );
                  } else if (state is GetRoomsLoading) {
                    return const LoadingWidget();
                  }
                  return Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Room",
                            style: TextStyle(
                                fontSize: 24.w(context),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Comfortaa"),
                          ),
                          SizedBoxApp(
                            h: 30.h(context),
                          ),
                          CustomDropdown<String>(
                            closedHeaderPadding: EdgeInsets.symmetric(
                                horizontal: 12.w(context),
                                vertical: 18.h(context)),
                            hintText: 'add item',
                            headerBuilder: (context, selectedItem) {
                              return Text(
                                selectedItem,
                              );
                            },
                            items: const [],
                            decoration: CustomDropdownDecoration(
                              closedBorder: Border.all(
                                  color: const Color(0xFFB1B1B1), width: 1),
                              expandedBorder: Border.all(
                                  color: const Color(0xFFB1B1B1), width: 1),
                            ),
                            onChanged: (value) {},
                          )
                        ],
                      )),
                      SizedBox(
                        width: 20.w(context),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plans",
                            style: TextStyle(
                                fontSize: 24.w(context),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Comfortaa"),
                          ),
                          SizedBoxApp(
                            h: 30.h(context),
                          ),
                          CustomDropdown<String>(
                            closedHeaderPadding: EdgeInsets.symmetric(
                                horizontal: 12.w(context),
                                vertical: 18.h(context)),
                            hintText: 'add item',
                            headerBuilder: (context, selectedItem) {
                              return Text(
                                selectedItem,
                              );
                            },
                            items: const [],
                            decoration: CustomDropdownDecoration(
                              closedBorder: Border.all(
                                  color: const Color(0xFFB1B1B1), width: 1),
                              expandedBorder: Border.all(
                                  color: const Color(0xFFB1B1B1), width: 1),
                            ),
                            onChanged: (value) {},
                          )
                        ],
                      )),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 50.h(context),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: Platform.isWindows ? 730.w(context) : 0),
            child: Row(children: [
              Expanded(
                child: BlocConsumer<CreateUsersCubit, CreateUsersState>(
                  listener: (context, state) {
                    if (state is CreateUserBookSuccess) {
                      context.read<SideBarCubit>().changeIndex(1);
                      setState(() {});
                    }
                  },
                  builder: (context, state) {
                    if (state is CreateUserBookLoading) {
                      return const LoadingWidget();
                    } else if (state is CreateUserBookError) {
                      return Column(
                        children: [
                          MaterialButton(
                              height: 54.h(context),
                              onPressed: () {
                                if (selectedRoom != null &&
                                    selectedRoom != null &&
                                    selectedPlan != null &&
                                    userId != null) {
                                  log("${selectedRoom?.id ?? ""}\n${DateTime.now().toString()}\n${DateTime.now().add(Duration(hours: selectedNumber)).toString()}\n${selectedPlan?.id?.toString() ?? ""}\n${userId ?? ""}");
                                  context
                                      .read<CreateUsersCubit>()
                                      .createUserBook(
                                        roomId: selectedRoom!.id!,
                                        seatCount: 1,
                                        startDate: DateTime.now().toString(),
                                        endDate: (selectedPlan?.stamp ?? "") ==
                                                "day"
                                            ? DateTime.now()
                                                .add(Duration(
                                                    days: selectedNumber))
                                                .toString()
                                            : (selectedPlan?.stamp ?? "") ==
                                                    "month"
                                                ? DateTime.now()
                                                    .add(Duration(
                                                        days: selectedNumber *
                                                            30))
                                                    .toString()
                                                : DateTime.now()
                                                    .add(Duration(
                                                        hours: selectedNumber))
                                                    .toString(),
                                        planId:
                                            selectedPlan?.id?.toString() ?? "",
                                        userId: userId ?? "",
                                      );
                                  // if (state is CreateUserBookSuccess) {
                                  //   context.read<SideBarCubit>().changeIndex(1);
                                  //   setState(() {});
                                  // }
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
                          if (selectedRoom != null &&
                              selectedRoom != null &&
                              selectedPlan != null &&
                              userId != null) {
                            log("${selectedRoom?.id ?? ""}\n${DateTime.now().toString()}\n${DateTime.now().add(Duration(hours: selectedNumber)).toString()}\n${selectedPlan?.id?.toString() ?? ""}\n${userId ?? ""}");
                            context.read<CreateUsersCubit>().createUserBook(
                                  roomId: selectedRoom!.id!,
                                  seatCount: 1,
                                  startDate: selectedDateTime.toString(),
                                  endDate: (selectedPlan?.stamp ?? "") == "day"
                                      ? DateTime.now()
                                          .add(Duration(days: selectedNumber))
                                          .toString()
                                      : (selectedPlan?.stamp ?? "") == "month"
                                          ? DateTime.now()
                                              .add(Duration(
                                                  days: selectedNumber * 30))
                                              .toString()
                                          : DateTime.now()
                                              .add(Duration(
                                                  hours: selectedNumber))
                                              .toString(),
                                  planId: selectedPlan?.id?.toString() ?? "",
                                  userId: userId ?? "",
                                );
                          }
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
                      roomIdController.clear();
                      planIdController.clear();
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
