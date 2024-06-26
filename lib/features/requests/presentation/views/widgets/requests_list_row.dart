import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/list_widget.dart';

class RequestsListRow extends StatelessWidget {
  final String text0;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final bool? header;

  final Color color;
  final bool hasAction;

  const RequestsListRow(
      {super.key,
      required this.text0,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      this.hasAction = false,
      required this.color,
      this.header = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: Platform.isWindows ? 900.w(context) : double.infinity,
            child: Row(
              children: [
                ListWidget(
                  text: text0,
                  fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
                ),
                SizedBox(
                  width: 20.w(context),
                ),
                SizedBox(
                  width: 200.w(context),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListWidget(
                      text: text1,
                      fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w(context),
                ),
                ListWidget(
                  text: text2,
                  fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
                ),
                ListWidget(
                  text: text3,
                  fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
                ),
                ListWidget(
                  text: text4,
                  fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
                ),
                SizedBox(
                  width: 20.w(context),
                ),
                SizedBox(
                  width: 200.w(context),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListWidget(
                      text: text5,
                      fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w(context),
                ),
              ],
            ),
          ),
        ),
        header!
            ? SizedBox(
                width: 140.w(context),
              )
            : SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      width: 60.w(context),
                      height: 60.h(context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF20473F), width: 2),
                      ),
                      child: Icon(
                        Icons.done,
                        size: 30.w(context),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                        width: 60.w(context),
                        height: 60.h(context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFFf04C29), width: 2),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 30.w(context),
                          color: const Color(0xFFF04C29),
                        )),
                  ],
                ),
              )
      ],
    );
  }
}
