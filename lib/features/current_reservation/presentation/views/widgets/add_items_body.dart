import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/core/widgets/app_custom_text_field.dart';

class AddItemsBody extends StatelessWidget {
  final void Function()? onTap;

  const AddItemsBody({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Item",
                    style: TextStyle(
                      fontSize: 24.w(context),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Comfortaa",
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        color: const Color(0xFF20473E).withOpacity(0.75),
                      ),
                      shape: BoxShape.rectangle),
                  child: Icon(
                    Icons.add,
                    size: 50.h(context),
                    color: const Color(0xFFF04C29),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 135,
                  width: MediaQuery.of(context).size.width * 7.5 / 11,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: AppCustomTextField(
                        hint: "Coffee",
                        textName: "Item",
                        readOnly: false,
                        controller: TextEditingController(),
                        color: Colors.white,
                      )),
                      SizedBoxApp(
                        w: 25.w(context),
                      ),
                      Expanded(
                          child: AppCustomTextField(
                        hint: "20 LE",
                        readOnly: false,
                        textName: "Price",
                        controller: TextEditingController(),
                        color: Colors.white,
                      ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        color: const Color(0xFF20473E).withOpacity(0.75),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 50.h(context),
                        color: const Color(0xFFF04C29),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      width: 175.w(context),
                      height: 50.h(context),
                      decoration: BoxDecoration(
                        color: const Color(0xFF20473E).withOpacity(0.75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text("Done",
                              style: TextStyle(
                                fontSize: 20.w(context),
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Comfortaa",
                              )))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
