import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/loading_widget.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/products_model.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/room_reservations_models/coffee.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/add_items_cubit/add_items_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/reservations_cubit/current_reservation_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/items_custom_text_field.dart';

import '../../../data/models/room_reservations_models/room_reservations_models.dart';

class AddItemsBody extends StatefulWidget {
  final void Function()? onTap;
  final RoomReservationsModels userReservation;

  const AddItemsBody({super.key, this.onTap, required this.userReservation});
  @override
  State<AddItemsBody> createState() => _AddItemsBodyState();
}

class _AddItemsBodyState extends State<AddItemsBody> {
  int itemCountText = 0;
  int itemPriceText = 0;
  ProductsModel? selectedProduct;
  int index = -1;
  Coffee? coffee;
  int refresh = 0;

  @override
  Widget build(BuildContext context) {
    // final List<String> items = ['tea', 'coffee', 'water', 'milk'];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          key: ValueKey(refresh),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocConsumer<GetProductCubit, GetProductState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetProductSuccess) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 155,
                        width: MediaQuery.of(context).size.width * 7.5 / 11,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Add Item",
                                        style: TextStyle(
                                          fontSize: 24.w(context),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Comfortaa",
                                        )),
                                    SizedBox(
                                      height: 32.h(context),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: DropdownMenu<ProductsModel>(
                                        onSelected: (value) {
                                          selectedProduct = value;
                                          itemCountText = 0;
                                          if (widget.userReservation.coffee !=
                                                  null &&
                                              widget.userReservation.coffee!
                                                  .isNotEmpty) {
                                            index = (widget
                                                    .userReservation.coffee
                                                    ?.indexWhere((element) =>
                                                        element.product ==
                                                        (value?.id ?? ""))) ??
                                                -1;
                                          }

                                          if (index >= 0) {
                                            coffee = widget
                                                .userReservation.coffee?[index];
                                            log((widget
                                                        .userReservation
                                                        .coffee?[index]
                                                        .product ??
                                                    "")
                                                .toString());
                                            log("ddd d d d d  d d ");
                                            log((coffee?.product).toString());
                                          }
                                          log(value.toString());
                                          log(index.toString());
                                          log((value?.id ?? "").toString());
                                          setState(() {});
                                        },
                                        dropdownMenuEntries: List.generate(
                                            state.productsList.length, (index) {
                                          return DropdownMenuEntry(
                                            label: state
                                                .productsList[index].title
                                                .toString(),
                                            value: state.productsList[index],
                                          );
                                        }),
                                        width: 450.w(context),
                                        enableFilter: true,
                                        enableSearch: true,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h(context),
                                    ),
                                    Text(
                                      "${(selectedProduct?.title ?? "Product")} count : ${(selectedProduct?.count ?? 0) - itemCountText}",
                                    )
                                  ],
                                )),
                            SizedBoxApp(
                              w: 25.w(context),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ItemsCustomTextField(
                                    hint:
                                        "count:  ${itemCountText.toString()}   price:   ${(selectedProduct?.price ?? 0).toString()}   Total:   ${((selectedProduct?.price ?? 0) * itemCountText).toString()} LE",
                                    textName: "Price",
                                    controller: TextEditingController(),
                                    color: Colors.white,
                                    maxCount: selectedProduct?.count ?? 0,
                                    count: itemCountText,
                                    onAddTap: () {
                                      if (itemCountText <
                                          (selectedProduct?.count ?? 0)) {
                                        ++itemCountText;

                                        setState(() {});
                                      }
                                    },
                                    removeColor:
                                        itemCountText > 0 - (coffee?.count ?? 0)
                                            ? const Color(0xFF20473E)
                                                .withOpacity(0.75)
                                            : Colors.grey,
                                    onRemoveTap: () {
                                      if (itemCountText >
                                          0 - (coffee?.count ?? 0)) {
                                        --itemCountText;
                                        // itemTotalPriceText =
                                        //     itemCountText * itemPriceText;
                                        setState(() {});
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 5.h(context),
                                  ),
                                  Text(
                                      "user had token ${index >= 0 ? (coffee?.count ?? 0) : 0} ${selectedProduct?.title ?? ""} Product")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is GetProductLoading) {
                  return const LoadingWidget();
                }
                return const Center(
                  child: Text("Not Available yet"),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocConsumer<AddItemsCubit, AddItemsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AddItemsLoading) {
                      return const LoadingWidget();
                    }
                    if (state is AddItemsFailure) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (itemCountText > 0) {
                                context.read<AddItemsCubit>().addItemToUser(
                                    productId: selectedProduct!.id!,
                                    reservationId:
                                        widget.userReservation.id ?? "",
                                    count: itemCountText);
                                if (state is AddItemsSuccess) {
                                  context.read<GetProductCubit>().getProducts();
                                  ++refresh;
                                  context
                                      .read<CurrentReservationCubit>()
                                      .getRoomsReservations();
                                  itemCountText = 0;
                                  itemPriceText = 0;
                                  selectedProduct = null;
                                  index = -1;
                                  coffee = null;
                                  refresh = 0;
                                }
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 175.w(context),
                              height: 50.h(context),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF20473E).withOpacity(0.75),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                    fontSize: 20.w(context),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Comfortaa",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(state.errorMessage),
                        ],
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        if (itemCountText > 0) {
                          context.read<AddItemsCubit>().addItemToUser(
                              productId: selectedProduct!.id!,
                              reservationId: widget.userReservation.id ?? "",
                              count: itemCountText);
                          if (state is AddItemsSuccess) {
                            context.read<GetProductCubit>().getProducts();
                            ++refresh;
                            context
                                .read<CurrentReservationCubit>()
                                .getRoomsReservations();
                            itemCountText = 0;
                            itemPriceText = 0;
                            selectedProduct = null;
                            index = -1;
                            coffee = null;
                            refresh = 0;
                          }
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: 175.w(context),
                        height: 50.h(context),
                        decoration: BoxDecoration(
                          color: const Color(0xFF20473E).withOpacity(0.75),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 20.w(context),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Comfortaa",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
