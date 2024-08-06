import 'dart:io';
import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/requests/presentation/views/widgets/requests_list_widget.dart';

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

  const RequestsListRow({
    super.key,
    required this.text0,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    this.hasAction = false,
    required this.color,
    this.header = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(2),
          5: FlexColumnWidth(3),
          6: FixedColumnWidth(200),
        },
        children: [
          TableRow(
            children: [
              RequestsListWidget(
                text: text0,
                fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
              ),
              RequestsListWidget(
                text: text1,
                fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
              ),
              RequestsListWidget(
                text: text2,
                fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
              ),
              RequestsListWidget(
                text: text3,
                fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
              ),
              RequestsListWidget(
                text: text4,
                fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
              ),
              RequestsListWidget(
                text: text5,
                fontWeight: header! ? FontWeight.w800 : FontWeight.w400,
              ),
              if (!header!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.w(context),
                      height: 60.h(context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF20473F), width: 2),
                      ),
                      child: Icon(Icons.done, size: 30.w(context)),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 60.w(context),
                      height: 60.h(context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFf04C29), width: 2),
                      ),
                      child: Icon(Icons.close, size: 30.w(context), color: const Color(0xFFF04C29)),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
