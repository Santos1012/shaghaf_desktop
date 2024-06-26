import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/reservations_cubit/current_reservation_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/list_widget.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/receipt_widget.dart';

import '../../../data/models/room_reservations_models/room_reservations_models.dart';

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
  final RoomReservationsModels? reservation;

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
      required this.color,
      this.reservation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w(context)),
      width: Platform.isWindows
          ? MediaQuery.of(context).size.width * 5.5 / 6
          : double.infinity,
      color: color,
      height: 80.h(context),
      child: Row(
        children: [
          ListWidget(
            text: text0,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            width: 30.w(context),
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
          if (reservation != null)
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ReceiptWidget(
                        fontWeight: FontWeight.w600,
                        reservation: reservation,
                      );
                    },
                  ).then(
                    (value) {
                      context
                          .read<CurrentReservationCubit>()
                          .getRoomsReservations();
                      context.read<CurrentReservationCubit>().refresh++;
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    textAlign: TextAlign.start,
                    "close time",
                    style: TextStyle(
                      fontSize: 24.w(context),
                      color: const Color.fromARGB(255, 32, 97, 84),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Comfortaa",
                    ),
                  ),
                ),
              ),
            ),
          if (reservation == null)
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
