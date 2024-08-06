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
  Widget _buildHeader(String title, String type, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.w(context),
            fontWeight: FontWeight.w500,
            fontFamily: "Comfortaa",
          ),
        ),
        SizedBox(width: 12.w(context)),
        Text(
          type,
          style: TextStyle(
            fontSize: 12.w(context),
            color: Colors.green,
            fontWeight: FontWeight.w500,
            fontFamily: "Comfortaa",
          ),
        ),
      ],
    );
  }

  Widget _buildRoomDropdown(List<RoomsModels> rooms, BuildContext context) {
    return DropdownMenu<RoomsModels>(
      inputDecorationTheme: _buildInputDecorationTheme(),
      expandedInsets: EdgeInsets.zero,
      onSelected: (value) {
        setState(() {
          selectedRoom = value;
          _updateDateTimeControllers();
          plan = value?.plans ?? [];
          selectedPlan = null;
        });
      },
      dropdownMenuEntries: rooms.map((room) {
        return DropdownMenuEntry(
          label: room.title.toString(),
          value: room,
        );
      }).toList(),
      width: 650.w(context),
      enableFilter: true,
      enableSearch: true,
    );
  }

  Widget _buildPlanDropdown(List<RoomPlan> plans, BuildContext context) {
    return DropdownMenu<RoomPlan>(
      inputDecorationTheme: _buildInputDecorationTheme(),
      expandedInsets: EdgeInsets.zero,
      key: ValueKey(selectedPlan),
      onSelected: (value) {
        setState(() {
          selectedPlan = value;
          _updateDateTimeControllers();
        });
      },
      dropdownMenuEntries: plans.map((plan) {
        return DropdownMenuEntry(
          label: plan.stamp.toString(),
          value: plan,
        );
      }).toList(),
      width: 650.w(context),
      enableFilter: true,
      enableSearch: true,
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: Colors.grey.withOpacity(0.2),
      filled: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFA4A4A4),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFA4A4A4),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFA4A4A4),
        ),
      ),
    );
  }

  void _updateDateTimeControllers() {
    final currentTime = DateTime.now();
    dateController.text = "${currentTime.day}/${currentTime.month}/${currentTime.year}";
    final hour = currentTime.hour < 10 ? '0${currentTime.hour}' : '${currentTime.hour}';
    final minute = currentTime.minute < 10 ? '0${currentTime.minute + 5}' : '${currentTime.minute + 5}';
    final period = currentTime.hour < 12 ? 'AM' : 'PM';
    final timeString = '$hour:$minute $period';
    timeController.text = timeString;
    selectedDateTime = DateTime.now();
  }

  Widget _buildDefaultState(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader("Room", "", context),
              SizedBoxApp(h: 30.h(context)),
              CustomDropdown<String>(
                closedHeaderPadding: EdgeInsets.symmetric(
                  horizontal: 12.w(context),
                  vertical: 18.h(context),
                ),
                hintText: 'add item',
                headerBuilder: (context, selectedItem) => Text(selectedItem),
                items: const [],
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(color: const Color(0xFFB1B1B1), width: 1),
                  expandedBorder: Border.all(color: const Color(0xFFB1B1B1), width: 1),
                ),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader("Plans", "", context),
              SizedBoxApp(h: 30.h(context)),
              CustomDropdown<String>(
                closedHeaderPadding: EdgeInsets.symmetric(
                  horizontal: 12.w(context),
                  vertical: 18.h(context),
                ),
                hintText: 'add item',
                headerBuilder: (context, selectedItem) => Text(selectedItem),
                items: const [],
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(color: const Color(0xFFB1B1B1), width: 1),
                  expandedBorder: Border.all(color: const Color(0xFFB1B1B1), width: 1),
                ),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 62.h(context)),
      child: SingleChildScrollView(
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
              ],
            ),
            SizedBox(
              height: 20.h(context),
            ),
            BlocConsumer<GetUsersCubit, GetUsersState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetRoomsSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 690.w(context)),
                        child: DropdownMenu<DatumGetAllUsers>(
                          expandedInsets: EdgeInsets.zero,
                          enableFilter: true,
                          enableSearch: true,
                          inputDecorationTheme:InputDecorationTheme(
                            fillColor:Colors.grey.withOpacity(0.2),
                            filled: true,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                          ),
                          hintText: "select user",
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
                          controller: searchPhoneController,
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
              padding: EdgeInsets.only(
                  right: Platform.isWindows ? 415.w(context) : 0),
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
              padding: EdgeInsets.only(
                  right: Platform.isWindows ? 415.w(context) : 0),
              child: BlocConsumer<GetUsersCubit, GetUsersState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetRoomsSuccess) {
                    return Row(
                      children: [
                        // Room Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHeader("Room", selectedRoom?.type ?? "Type", context),
                              SizedBoxApp(h: 30.h(context)),
                              _buildRoomDropdown(state.roomsModel, context),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w(context)),
                        // Plans Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHeader("Plans", selectedPlan?.stamp ?? "Type", context),
                              SizedBoxApp(h: 30.h(context)),
                              _buildPlanDropdown(plan, context),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetRoomsLoading) {
                    return const LoadingWidget();
                  }
                  return _buildDefaultState(context);
                },
              )
              ,
            ),
            SizedBox(
              height: 50.h(context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: Platform.isWindows ? 730.w(context) : 0),
              child: Row(children: [
                Expanded(
                  child: BlocConsumer<CreateUsersCubit, CreateUsersState>(
                    listener: (context, state) {
                      if(state is CreateUserSuccess){
                        context
                            .read<CreateUsersCubit>()
                            .createUserBook(
                          roomId: selectedRoom!.id!,
                          seatCount: 1,
                          startDate: DateTime.now().toString(),
                          endDate: (selectedPlan?.stamp ??
                              "") ==
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
                              hours:
                              selectedNumber))
                              .toString(),
                          planId:
                          selectedPlan?.id?.toString() ??
                              "",
                          userId: state.createUserModel.data!.id ?? "",
                        );
                      }
                      if (state is CreateUserBookSuccess) {
                        BlocProvider.of<SideBarCubit>(context).changeIndex(1);
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateUserBookLoading||state is CreateUserLoading) {
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
                                          endDate: (selectedPlan?.stamp ??
                                                      "") ==
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
                                                          hours:
                                                              selectedNumber))
                                                      .toString(),
                                          planId:
                                              selectedPlan?.id?.toString() ??
                                                  "",
                                          userId: userId ?? "",
                                        );
                                    // if (state is CreateUserBookSuccess) {
                                    //   context.read<SideBarCubit>().changeIndex(1);
                                    //   setState(() {});
                                    // }
                                  }
                                  context
                                      .read<CreateUsersCubit>()
                                      .createUser(
                                    username: nameController.text,
                                    phone: phoneController.text,
                                  );
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
                                    startDate: DateTime.now().toString(),
                                    endDate: (selectedPlan?.stamp ?? "") ==
                                            "day"
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
                            context
                                .read<CreateUsersCubit>()
                                .createUser(
                              username: nameController.text,
                              phone: phoneController.text,
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.w(context))),
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
      ),
    );
  }
}
