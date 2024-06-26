import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/service_locator.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/loading_widget.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/end_reservation_cubit/end_reservation_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/list_widget.dart';

import '../../../data/models/room_reservations_models/room_reservations_models.dart';
import '../../../data/repositories/get_reservations_implementation.dart';
import '../../manager/reservations_cubit/current_reservation_cubit.dart';

class ReceiptWidget extends StatefulWidget {
  final FontWeight? fontWeight;
  final RoomReservationsModels? reservation;

  const ReceiptWidget({super.key, this.fontWeight, this.reservation});

  @override
  State<ReceiptWidget> createState() => _ReceiptWidgetState();
}

class _ReceiptWidgetState extends State<ReceiptWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return EndReservationCubit(
                gitIt<CurrentReservationRepoImplementation>());
          },
        ),
        BlocProvider(
          create: (context) {
            return GetProductCubit(
                gitIt<CurrentReservationRepoImplementation>())
              ..getProducts();
          },
        ),
        BlocProvider(
          create: (context) {
            return CurrentReservationCubit(
                gitIt<CurrentReservationRepoImplementation>())
              ..getRoomsReservations();
          },
        ),
      ],
      child: AlertDialog(
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
                widget.reservation != null
                    ? widget.reservation!.user?.username ?? "Not available"
                    : "Ahmed Mohamed",
                style: TextStyle(
                  fontSize: 24.w(context),
                  color: Colors.black,
                  fontWeight: widget.fontWeight,
                  fontFamily: "Comfortaa",
                ),
              ),
              SizedBoxApp(
                h: 24.h(context),
              ),
              Expanded(
                child: (widget.reservation != null &&
                        widget.reservation!.coffee != null &&
                        widget.reservation!.coffee!.isNotEmpty)
                    ? BlocConsumer<GetProductCubit, GetProductState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          int index1 = -1;
                          if (state is GetProductSuccess &&
                              state.productsList.isNotEmpty) {
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  index1 = (state.productsList.indexWhere(
                                      (element) =>
                                          element.id ==
                                          (widget.reservation?.coffee?[index]
                                                  .product ??
                                              "")));

                                  if (index1 != -1) {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            state.productsList[index1].title ??
                                                "",
                                            style: TextStyle(
                                              fontSize: index == 0
                                                  ? 20.w(context)
                                                  : 18.w(context),
                                              fontWeight: index == 0
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: index == 0
                                                  ? Colors.black
                                                  : const Color(0xFF9D9D9D),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.reservation!.coffee![index]
                                                    .count
                                                    ?.toString() ??
                                                "",
                                            style: TextStyle(
                                              fontSize: index == 0
                                                  ? 20.w(context)
                                                  : 18.w(context),
                                              fontWeight: index == 0
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: index == 0
                                                  ? Colors.black
                                                  : const Color(0xFF9D9D9D),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            ((widget.reservation!.coffee![index]
                                                            .count ??
                                                        0) *
                                                    (state.productsList[index1]
                                                            .price ??
                                                        0))
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: index == 0
                                                  ? 20.w(context)
                                                  : 18.w(context),
                                              fontWeight: index == 0
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: index == 0
                                                  ? Colors.black
                                                  : const Color(0xFF9D9D9D),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return const Center(
                                    child: Text("Not Available"),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 24.h(context),
                                  );
                                },
                                itemCount: widget.reservation!.coffee != null
                                    ? widget.reservation!.coffee!.length
                                    : 0);
                          } else if (state is GetProductLoading) {
                            return const LoadingWidget();
                          }
                          return const Center(
                            child: Text("Not Available"),
                          );
                        })
                    : const Center(
                        child: Text("Not Available"),
                      ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ItemOfListClose(
                  text: "Full Time",
                  text1: widget.reservation == null
                      ? "3 hours"
                      : "${widget.reservation!.endDate!.year - widget.reservation!.startDate!.year} y ${widget.reservation!.endDate!.month - widget.reservation!.startDate!.month} m ${widget.reservation!.endDate!.day - widget.reservation!.startDate!.day} d ${widget.reservation!.endDate!.hour - widget.reservation!.startDate!.hour} h ${widget.reservation!.endDate!.minute - widget.reservation!.startDate!.minute} m",
                  text2: widget.reservation == null
                      ? "50 LE"
                      : widget.reservation!.reservationPrice?.toString() ?? "0",
                  index: 0),
              SizedBoxApp(
                h: 22.h(context),
              ),
              ItemOfListClose(
                  text: "Products Price",
                  text1: "",
                  text2: widget.reservation == null
                      ? "120 LE"
                      : widget.reservation!.coffeePrice?.toString() ?? "0",
                  index: 0),
              ItemOfListClose(
                  text: "Total Price",
                  text1: "",
                  text2: widget.reservation == null
                      ? "120 LE"
                      : widget.reservation!.totalPrice?.toString() ?? "0",
                  index: 0),
              SizedBoxApp(
                h: 22.h(context),
              ),
              BlocConsumer<EndReservationCubit, EndReservationState>(
                listener: (BuildContext context, Object? state) {
                  if (state is EndReservationSuccess) {
                    Navigator.pop(context);
                    context
                        .read<CurrentReservationCubit>()
                        .getRoomsReservations();
                    context.read<CurrentReservationCubit>().refresh++;
                  }
                  setState(() {});
                },
                builder: (BuildContext context, state) {
                  if (state is EndReservationFailure) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            context.read<EndReservationCubit>().endReservation(
                                reservationId: widget.reservation?.id ?? "");
                            if (state is EndReservationSuccess) {
                              // context.read<CurrentReservationCubit>().endState=EndReservationSuccess();
                              Navigator.pop(context);
                              context
                                  .read<CurrentReservationCubit>()
                                  .getRoomsReservations();
                              context.read<CurrentReservationCubit>().refresh++;
                            }
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.w(context)),
                          ),
                          padding: EdgeInsets.all(16.w(context)),
                          color: const Color(0xFF20473E).withOpacity(0.75),
                          child: const Text(
                            "End & Print",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 5.h(context)),
                        Text(state.errorMessage)
                      ],
                    );
                  } else if (state is EndReservationLoading) {
                    return const LoadingWidget();
                  }
                  return MaterialButton(
                    onPressed: () {
                      context.read<EndReservationCubit>().endReservation(
                          reservationId: widget.reservation?.id ?? "");
                      if (state is EndReservationSuccess) {
                        //  context.read<CurrentReservationCubit>().endState=EndReservationSuccess();
                        Navigator.pop(context);
                        context
                            .read<CurrentReservationCubit>()
                            .getRoomsReservations();
                        context.read<CurrentReservationCubit>().refresh++;
                      }
                      setState(() {});
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.w(context)),
                    ),
                    padding: EdgeInsets.all(16.w(context)),
                    color: const Color(0xFF20473E).withOpacity(0.75),
                    child: const Text(
                      "End & Print",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
