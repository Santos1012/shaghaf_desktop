import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

class ListWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final bool isAction;

  const ListWidget(
      {super.key, required this.text, this.fontWeight, this.isAction = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
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
    );
  }
}
