import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    String userType = "user";

    String? selectedDate;
    DateTime x = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.w(context), vertical: 62.h(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add new user",
                  style: TextStyle(
                    fontSize: 20.w(context),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Comfortaa",
                  ),
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
                  padding: EdgeInsets.only(
                      right: Platform.isWindows ? 415.w(context) : 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppCustomTextField(
                          phone: true,
                          hint: "Enter E-mail",
                          textName: "Phone E-mail",
                          controller: emailController,
                        ),
                      ),
                      SizedBox(
                        width: 20.w(context),
                      ),
                      Expanded(
                        child: AppCustomTextField(
                          phone: true,
                          hint: "Enter Password",
                          textName: "Phone Password",
                          controller: passwordController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 46.h(context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Platform.isWindows ? 415.w(context) : 0),
                  child: Row(
                    children: [
                      // Expanded(
                      //   child: AppCustomTextField(
                      //     phone: true,
                      //     hint: "Enter Date",
                      //     textName: "Phone Date",
                      //     controller: dateController,
                      //   ),
                      // ),
                      SizedBoxApp(h: 24.h(context)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select BirthDate",
                              style: TextStyle(
                                  fontSize: 7.w(context),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Comfortaa"),
                            ),
                            SizedBox(
                              height: 32.h(context),
                            ),
                            GestureDetector(
                              key: ValueKey("$selectedDate"),
                              onTap: () async {
                                // x = await showDatePicker(
                                //   initialEntryMode:
                                //       DatePickerEntryMode.calendar,
                                //   currentDate: DateTime.now(),
                                //   context: context,
                                //   confirmText: selectedDate,
                                //   firstDate: DateTime.now(),
                                //   lastDate: DateTime(DateTime.now().year + 5),
                                // ) as DateTime;
                                // log(x.toString());
                                // log(x.runtimeType.toString());
                                // setState(() {
                                //   selectedDate = x.toString();
                                //   log(selectedDate.toString());
                                // });
                              },
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.white.withOpacity(0.75),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1.w(context)),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        x = await showDatePicker(
                                          initialEntryMode:
                                              DatePickerEntryMode.calendar,
                                          currentDate: x,
                                          context: context,
                                          confirmText: selectedDate,
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime(DateTime.now().year + 5),
                                        ) as DateTime;
                                        log(x.toString());
                                        log(x.runtimeType.toString());
                                        setState(() {
                                          selectedDate = x.toString();
                                          log(selectedDate.toString());
                                        });
                                      },
                                      icon: const Icon(Icons.calendar_month)),
                                  hintText:
                                      " ${x.year} - ${x.month} - ${x.day}",
                                  hintStyle: TextStyle(
                                      fontSize: 15.w(context),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Comfortaa"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 20.w(context),
                      ),
                      Expanded(
                        child: AppCustomTextField(
                          phone: true,
                          readOnly: true,
                          hint: userType,
                          textName: "Type",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 46.h(context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Platform.isWindows ? 730.w(context) : 0),
                  child: Row(children: [
                    Expanded(
                      child: MaterialButton(
                          height: 54.h(context),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.w(context))),
                          color: const Color(0xFF20473F),
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Comfortaa"),
                          )),
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
                            emailController.clear();
                            passwordController.clear();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.w(context))),
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
        ));
  }
}
