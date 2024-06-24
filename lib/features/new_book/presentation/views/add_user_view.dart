// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/media_query.dart';
import 'package:saghaf_desktop/core/service_locator.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';
import 'package:saghaf_desktop/features/new_book/data/repositories/get_users_repo_implementation.dart';
import 'package:saghaf_desktop/features/new_book/presentation/manager/get_users_cubit.dart';

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
    return BlocProvider(
      create: (context) => GetUsersCubit(sl<GetUsersRepoImplementation>()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
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
                  Row(
                    children: [
                      Expanded(
                        child: AppCustomTextField(
                          hint: "Enter E-mail",
                          textName: "E-mail",
                          controller: emailController,
                        ),
                      ),
                      SizedBox(
                        width: 20.w(context),
                      ),
                      Expanded(
                        child: AppCustomTextField(
                          hint: "Enter Password",
                          textName: "Password",
                          controller: passwordController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 46.h(context),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppCustomTextField(
                          readOnly: true,
                          onTap: () async {
                            x = await showDatePicker(
                              initialEntryMode: DatePickerEntryMode.calendar,
                              currentDate: x,
                              context: context,
                              confirmText: "Selected Date",
                              firstDate: DateTime(DateTime.now().year - 70),
                              lastDate: DateTime(DateTime.now().year + 5),
                            ) as DateTime;
                            // log(x.toString());
                            // log(x.runtimeType.toString());
                            setState(() {
                              dateController.text = x.toString();
                              selectedDate = x.toString();
                              // log(selectedDate.toString());
                            });
                          },
                          icon: Icons.calendar_month,
                          hint: " ${x.year} - ${x.month} - ${x.day}",
                          textName: "Select Birthday",
                          controller: dateController,
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
                  SizedBox(
                    height: 46.h(context),
                  ),
                  Row(children: [
                    Expanded(
                      child: BlocConsumer<GetUsersCubit, GetUsersState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return MaterialButton(
                              height: 54.h(context),
                              onPressed: () {
                                BlocProvider.of<CreateUsersCubit>(context)
                                    .createUser(
                                  username: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  birthdate: dateController.text,
                                );
                                nameController.clear();
                                phoneController.clear();
                                dateController.clear();
                                emailController.clear();
                                passwordController.clear();
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
                  ])
                ],
              ),
            ),
          )),
    );
  }
}
