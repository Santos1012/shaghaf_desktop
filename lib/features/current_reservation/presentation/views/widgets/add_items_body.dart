import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/items_custom_text_field.dart';

class AddItemsBody extends StatefulWidget {
  final void Function()? onTap;

  const AddItemsBody({super.key, this.onTap});

  @override
  State<AddItemsBody> createState() => _AddItemsBodyState();
}

class _AddItemsBodyState extends State<AddItemsBody> {
  int itemCountText = 1;
  int itemPriceText = 20;
  int itemTotalPriceText = 20;
  @override
  Widget build(BuildContext context) {
    final List<String> items = ['tea', 'coffee', 'water', 'milk'];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: const BorderRadius.all(
                //         Radius.circular(5),
                //       ),
                //       border: Border.all(
                //         color: const Color(0xFF20473E).withOpacity(0.75),
                //       ),
                //       shape: BoxShape.rectangle),
                //   child: Icon(
                //     Icons.add,
                //     size: 50.h(context),
                //     color: const Color(0xFFF04C29),
                //   ),
                // )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 135,
                  width: MediaQuery.of(context).size.width * 7.5 / 11,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
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
                          CustomDropdown<String>(
                            hintText: 'add item',
                            headerBuilder: (context, selectedItem) {
                              return Text(
                                selectedItem,
                              );
                            },
                            items: items,
                            initialItem: items[0],
                            decoration: CustomDropdownDecoration(
                              closedBorder: Border.all(
                                  color: const Color(0xFFB1B1B1), width: 1),
                              expandedBorder: Border.all(
                                  color: const Color(0xFFB1B1B1), width: 1),
                            ),
                            onChanged: (value) {
                              log('changing value to: $value');
                            },
                          ),
                        ],
                      )),
                      SizedBoxApp(
                        w: 25.w(context),
                      ),
                      Expanded(
                        child: ItemsCustomTextField(
                          hint:
                              "count:  ${itemCountText.toString()}   price:   ${itemPriceText.toString()}   Total:   ${itemTotalPriceText.toString()} LE",
                          textName: "Price",
                          controller: TextEditingController(),
                          color: Colors.white,
                          maxCount: 20,
                          count: itemCountText,
                          onAddTap: () {
                            if (itemCountText < 20) {
                              ++itemCountText;
                              itemTotalPriceText =
                                  itemCountText * itemPriceText;
                              setState(() {});
                            }
                          },
                          onRemoveTap: () {
                            if (itemCountText > 0) {
                              --itemCountText;
                              itemTotalPriceText =
                                  itemCountText * itemPriceText;
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: onTap,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: const BorderRadius.all(
                //         Radius.circular(5),
                //       ),
                //       border: Border.all(
                //         color: const Color(0xFF20473E).withOpacity(0.75),
                //       ),
                //       shape: BoxShape.rectangle,
                //     ),
                //     child: Center(
                //       child: Icon(
                //         Icons.remove,
                //         size: 50.h(context),
                //         color: const Color(0xFFF04C29),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
