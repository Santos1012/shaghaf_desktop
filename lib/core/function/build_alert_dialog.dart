import 'package:flutter/material.dart';

Future<dynamic> buildShowDialog(BuildContext context, Widget content) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: content,
      );
    },
  );
}
