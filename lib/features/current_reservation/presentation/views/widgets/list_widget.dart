import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/receipt_widget.dart';

class ListWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final bool isAction;
  final bool? closed;

  const ListWidget(
      {super.key,
      required this.text,
      this.fontWeight,
      this.isAction = false,
      this.closed = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isAction ? 1 : 1,
      child: GestureDetector(
        onTap: () {
          if (closed!) {
            showDialog(
              context: context,
              builder: (context) {
                return ReceiptWidget(fontWeight: fontWeight);
              },
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(isAction ? 12 : 0),
          child: Text(
            textAlign: TextAlign.start,
            text,
            style: TextStyle(
              fontSize: 24.w(context),
              color: isAction
                  ? const Color(0xFFF04C29)
                  : fontWeight == FontWeight.w600
                      ? Colors.black
                      : const Color(0xFF494949),
              fontWeight: fontWeight ?? FontWeight.w400,
              fontFamily: "Comfortaa",
            ),
          ),
        ),
      ),
    );
  }
}

class ListOfClose extends StatelessWidget {
  const ListOfClose({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> textClose = [
      "Items",
      "water",
      "tea",
      "coffee",
      "Juice",
    ];
    List<String> text1Close = [
      "Quantity",
      "1",
      "2",
      "5",
      "1",
    ];
    List<String> text2Close = [
      "Price",
      "20LE",
      "40LE",
      "60LE",
      "30LE",
    ];
    return ListView.separated(
        itemBuilder: (context, index) {
          return ItemOfListClose(
            text: textClose[index],
            text1: text1Close[index],
            text2: text2Close[index],
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 24.h(context),
          );
        },
        itemCount: 5);
  }
}

class ItemOfListClose extends StatelessWidget {
  const ItemOfListClose({
    super.key,
    required this.text,
    required this.text1,
    required this.text2,
    required this.index,
  });

  final String text;
  final String text1;
  final String text2;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: index == 0 ? 20.w(context) : 18.w(context),
              fontWeight: index == 0 ? FontWeight.w500 : FontWeight.w400,
              color: index == 0 ? Colors.black : const Color(0xFF9D9D9D),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            text1,
            style: TextStyle(
              fontSize: index == 0 ? 20.w(context) : 18.w(context),
              fontWeight: index == 0 ? FontWeight.w500 : FontWeight.w400,
              color: index == 0 ? Colors.black : const Color(0xFF9D9D9D),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
              fontSize: index == 0 ? 20.w(context) : 18.w(context),
              fontWeight: index == 0 ? FontWeight.w500 : FontWeight.w400,
              color: index == 0 ? Colors.black : const Color(0xFF9D9D9D),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
