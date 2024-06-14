import 'package:flutter/services.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

class AppCustomTextField extends StatelessWidget {
  final String hint;
  final bool? isSearch;
  final String textName;
  final TextEditingController? controller;
  final bool? readOnly;
  final void Function()? onTap;
  final Color? color;
  final bool? phone;

  const AppCustomTextField(
      {super.key,
      required this.hint,
      this.isSearch = false,
      required this.textName,
       this.controller,
      this.readOnly,
      this.onTap, this.color, this.phone=false});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textName,
          style: TextStyle(
              fontSize: 24.w(context),
              fontWeight: FontWeight.w500,
              fontFamily: "Comfortaa"),
        ),
        SizedBox(
          height: 32.h(context),
        ),
        TextFormField(
          inputFormatters: phone==true? [
            LengthLimitingTextInputFormatter(11), // Limits the input to 2 characters
          ]:[],
          controller: controller,
          readOnly: readOnly ?? false,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w(context), vertical: 20.h(context)),
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: "Comfortaa"),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      isSearch == true ? Colors.grey : const Color(0xFFA4A4A4)),
              borderRadius: BorderRadius.circular(14.w(context)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isSearch == true
                      ? Colors.grey.withOpacity(0.2)
                      : const Color(0xFFA4A4A4)),
              borderRadius: BorderRadius.circular(14.w(context)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isSearch == true
                      ? Colors.grey.withOpacity(0.2)
                      : const Color(0xFFA4A4A4)),
              borderRadius: BorderRadius.circular(14.w(context)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isSearch == true
                      ? Colors.grey.withOpacity(0.2)
                      : const Color(0xFFA4A4A4)),
              borderRadius: BorderRadius.circular(14.w(context)),
            ),
            prefixIcon: isSearch == false
                ? null
                : const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
            fillColor:color?? Colors.grey.withOpacity(0.2),
            filled: true,
          ),
        )
      ],
    );
  }
}
