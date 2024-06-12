import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

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
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (closed!) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w(context), vertical: 24.h(context)),
                      width: 512.w(context),
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
                            "Ahmed Mohamed",
                            style: TextStyle(
                              fontSize: 24.w(context),
                              color: Colors.black,
                              fontWeight: fontWeight,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                          SizedBoxApp(
                            h: 24.h(context),),
                          const Expanded(child: ListOfClose()),
                          const Divider(
                            color: Colors.black,
                          ),
                          const ItemOfListClose(
                              text: "Full Time",
                              text1: "3 hours",
                              text2: "50 LE",
                              index: 0),
                          SizedBoxApp(
                            h: 22.h(context),
                          ),
                          const ItemOfListClose(
                              text: "Full Time",
                              text1: "",
                              text2: "50 LE",
                              index: 0),
                          SizedBoxApp(
                            h: 22.h(context),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.w(context)),
                            ),
                            padding: EdgeInsets.all(16.w(context)),
                            child: Text(
                              "Print",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF20473E).withOpacity(0.75),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.w(context),
              color: isAction ? const Color(0xFFF04C29) : fontWeight==FontWeight.w600?Colors.black:Color(0xFF494949),
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
