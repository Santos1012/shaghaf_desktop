import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/loading_widget.dart';
import 'package:saghaf_desktop/features/current_reservation/data/models/products_model.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/add_items_cubit/add_items_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/manager/reservations_cubit/current_reservation_cubit.dart';
import '../../../data/models/room_reservations_models/room_reservations_models.dart';

class AddItemsBody extends StatefulWidget {
  final void Function()? onTap;
  final RoomReservationsModels userReservation;

  const AddItemsBody({super.key, this.onTap, required this.userReservation});

  @override
  State<AddItemsBody> createState() => _AddItemsBodyState();
}

class _AddItemsBodyState extends State<AddItemsBody> {
  List<Map<String, dynamic>> items = [];

  void clearItems() {
    setState(() {
      items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocConsumer<GetProductCubit, GetProductState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetProductSuccess) {
                  return Column(
                    children: [
                      Row(
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
                                            setState(() {
                                              items.add({
                                                'product': value,
                                                'count': 1, // Default count is 1
                                              });
                                            });
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ...items.map((item) {
                        return ItemRow(
                          key: ValueKey(item['product'].id),
                          item: item,
                          onAddTap: () {
                            setState(() {
                              item['count']++;
                            });
                          },
                          onRemoveTap: () {
                            setState(() {
                              if (item['count'] > 1) {
                                item['count']--;
                              } else {
                                items.remove(item); // Remove the item if count is less than 1
                              }
                            });
                          },
                        );
                      }).toList(),
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
                  listener: (context, state) {
                    if (state is AddItemsSuccess) {
                      clearItems();
                      context.read<CurrentReservationCubit>().getRoomsReservations();
                    } else if (state is AddItemsFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddItemsLoading) {
                      return const LoadingWidget();
                    }
                    return GestureDetector(
                      onTap: () {
                        if (items.isNotEmpty) {
                          context.read<AddItemsCubit>().addItemToUser(
                            product: items,
                            reservationId: widget.userReservation.id ?? "",
                          );
                        }
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

class ItemRow extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onAddTap;
  final VoidCallback onRemoveTap;

  const ItemRow({
    super.key,
    required this.item,
    required this.onAddTap,
    required this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(item['product'].title ?? "Product")),
          Expanded(child: Text('Count: ${item['count']}')),
          Expanded(child: Text('Price: ${item['product'].price ?? 0}')),
          Expanded(
            child: Text(
                'Total: ${(item['count'] * (item['product'].price ?? 0)).toString()} LE'),
          ),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: onAddTap,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: onRemoveTap,
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


