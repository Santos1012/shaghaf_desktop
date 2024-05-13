import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/requests/widgets/requests_list_row.dart';

class RequestsBody extends StatefulWidget {
  const RequestsBody({super.key});

  @override
  State<RequestsBody> createState() => _RequestsBodyState();
}

class _RequestsBodyState extends State<RequestsBody> {
  // bool isTapped = false;

  // int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBoxApp(
            h: 40.h(context),
          ),
          Text(
            "Requests",
            style: TextStyle(
              fontSize: 32.w(context),
              fontWeight: FontWeight.w700,
              fontFamily: "Comfortaa",
            ),
          ),
          SizedBoxApp(
            h: 40.h(context),
          ),
          RequestsListRow(
            text0: "Name",
            text1: "Phone",
            text2: "Date",
            text3: 'Time',
            text4: "Timer",
            text5: "Room",
            color: Colors.grey.withOpacity(0.1),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 7 / 8,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // if (selectedIndex != index) {
                    //   isTapped = true;
                    //   selectedIndex = index;
                    // } else {
                    //   isTapped = false;
                    //   selectedIndex = -1;
                    // }
                    setState(() {});
                  },
                  child: RequestsListRow(
                    text0: "Ahmed",
                    text1: "0123456789",
                    text2: "2/5/2024",
                    text3: '5:00 pm',
                    text4: "3 hours",
                    text5: index % 2 == 0
                        ? "Birthday"
                        : index % 3 == 0
                            ? "Funny"
                            : "Training",
                    hasAction: true,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
