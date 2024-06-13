import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';

class NewBookBody extends StatelessWidget {
  const NewBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _items = [
      'smoking room',
      'gaming room',
      'edu room',
      'other'
    ];
    final List<String> _place = [
      'Roxy',
      'Masr Elgededa’',
    ];
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
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
          Row(
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
            padding: EdgeInsets.only(right: Platform.isWindows ?415.w(context):0),
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
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 46.h(context),
          ),
          Padding(
            padding: EdgeInsets.only(right:Platform.isWindows ? 415.w(context):0),
            child: Row(
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
                      closedHeaderPadding: EdgeInsets.symmetric(horizontal: 12.w(context),vertical: 18.h(context)),
                      hintText: 'add item',
                      headerBuilder: (context, selectedItem) {
                        return Text(
                          selectedItem,
                        );
                      },
                      items: _items,
                      initialItem: _items[0],
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
                          "Place",
                          style: TextStyle(
                              fontSize: 24.w(context),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Comfortaa"),
                        ),
                        SizedBoxApp(
                          h: 30.h(context),
                        ),
                        CustomDropdown<String>(
                          closedHeaderPadding: EdgeInsets.symmetric(horizontal: 12.w(context),vertical: 18.h(context)),
                          hintText: 'add item',
                          headerBuilder: (context, selectedItem) {
                            return Text(
                              selectedItem,
                            );
                          },
                          items: _place,
                          initialItem: _place[0],
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
            ),
          ),
          SizedBox(
            height: 46.h(context),
          ),
          Padding(
            padding: EdgeInsets.only(right: Platform.isWindows ?  730.w(context):0),
            child: Row(children: [
              Expanded(
                child: MaterialButton(
                    height: 54.h(context),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w(context))),
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
