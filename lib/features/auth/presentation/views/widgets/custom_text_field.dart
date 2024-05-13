import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/media_query.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboard,
    this.validator,
    this.icon,
    this.controller,
    this.textInputType,
  });

  final String label;
  final String hint;
  final IconData? icon;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w200,
              fontFamily: "Comfortaa",
            ),
          ),
        ),
        SizedBoxApp(
          h: 10.h(context),
        ),
        SizedBox(
          height: 50.h(context),
          child: TextFormField(
            cursorColor: Colors.white,
            cursorHeight: 30.h(context),
            controller: controller,
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3), width: .1.w(context)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3), width: .1.w(context)),
              ),
              // prefixIcon: Icon(
              //   icon,
              //   size: 18.w(context),
              // ),
              prefixIconColor: Colors.grey,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.withOpacity(0.8),
                fontFamily: "Comfortaa",
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            keyboardType: textInputType ?? keyboard,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
