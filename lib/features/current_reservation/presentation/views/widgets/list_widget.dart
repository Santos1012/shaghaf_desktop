import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

class ListWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final bool isAction;
  final bool? closed;
  const ListWidget(
      {super.key, required this.text, this.fontWeight, this.isAction = false, this.closed=false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (closed!) {

                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w(context),vertical: 24.h(context)),
                      width:512.w(context),
                      height: 674.h(context),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.w(context)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/shaghaf_logo.png",
                            width: 84.w(context),
                            height: 141.h(context),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 24.h(context),
                          ),
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: 24.w(context),
                              color: isAction ? const Color(0xFFF04C29) : Colors.black,
                              fontWeight: fontWeight ?? FontWeight.w400,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },);

            }
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.w(context),
              color: isAction ? const Color(0xFFF04C29) : Colors.black,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: "Comfortaa",
            ),
          ),
        ),
      ),
    );
  }
}
