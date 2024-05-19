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
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 6 / 8,
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
            ],
          ),
        ),
        if (hasAction &&
            MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 6 / 8 >=
                200)
          Container(
            color: Colors.grey.withOpacity(0.1),
            height: 80.h(context),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Container(
                    width: 60.w(context),
                    height: 60.h(context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF20473F), width: 2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.done),
                      )),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          width: 60.w(context),
                          height: 60.h(context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFf04C29), width: 2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: Color(0xFFF04C29),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
