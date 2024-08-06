import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

class RequestsListWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final bool isAction;

  const RequestsListWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.isAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200.w(context)),
      child: Text(
        textAlign:         TextAlign.start,
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.w(context),
          color: isAction ? const Color(0xFFF04C29) : Colors.black,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: "Comfortaa",
        ),
      ),
    );
  }
}
