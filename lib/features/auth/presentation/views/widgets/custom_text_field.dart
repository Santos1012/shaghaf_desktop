import 'package:flutter/material.dart';
import 'package:saghaf_desktop/core/media_query.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboard,
    this.validator,
    this.icon,
    this.controller,
    this.textInputType,
    this.isPass,
  });

  final String label;
  final String hint;
  final IconData? icon;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? isPass;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visible = true;
  bool isValid = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        validate();
      }
    });
  }

  void validate() {
    final validationResult = widget.validator?.call(widget.controller?.text);
    setState(() {
      isValid = validationResult == null;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            widget.label,
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
        TextFormField(
          focusNode: _focusNode,
          cursorColor: Colors.white,
          cursorHeight: 25.h(context),
          obscureText: widget.isPass == true ? visible : false,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
            suffixIcon: widget.isPass == true
                ? IconButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(
                visible ? Icons.visibility : Icons.visibility_off,
              ),
            )
                : null,
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
            errorBorder: !isValid
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.3), width: .1.w(context)),
            )
                : null,
            prefixIconColor: Colors.grey,
            hintText: widget.hint,
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
          keyboardType: widget.textInputType ?? widget.keyboard,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
