import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/list_widget.dart';

class ListRow extends StatelessWidget {
  final String text0;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final Color color;
  final bool isAction;

  const ListRow(
      {super.key,
      required this.text0,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.text6,
      this.isAction = false,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Platform.isWindows ? MediaQuery.of(context).size.width * 5 / 6:double.infinity,
      color: color,
      height: 80.h(context),
      child: Row(
        children: [
          ListWidget(
            text: text0,
            fontWeight: FontWeight.w600,
          ),
          ListWidget(
            text: text1,
            fontWeight: FontWeight.w600,
          ),
          ListWidget(
            text: text2,
            fontWeight: FontWeight.w600,
          ),
          ListWidget(
            text: text3,
            fontWeight: FontWeight.w600,
          ),
          ListWidget(
            text: text4,
            fontWeight: FontWeight.w600,
          ),
          ListWidget(
            text: text5,
            fontWeight: FontWeight.w600,
          ),
          ListWidget(
            isAction: isAction,
            text: text6,
            closed: true,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
