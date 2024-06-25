import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

class ItemsCustomTextField extends StatelessWidget {
  final String hint;
  final bool? isSearch;
  final String textName;
  final TextEditingController? controller;
  final bool? readOnly;
  final void Function()? onRemoveTap;
  final void Function()? onAddTap;
  final Color? color;
  final bool? phone;
  final int maxCount;
  final int count;
  final IconData? icon;

  const ItemsCustomTextField(
      {super.key,
      required this.hint,
      required this.maxCount,
      required this.count,
      this.isSearch = false,
      required this.textName,
      this.controller,
      this.readOnly,
      this.onRemoveTap,
      this.onAddTap,
      this.color,
      this.phone = false,
      this.icon});

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
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 50.w(context), vertical: 20.h(context)),
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
            prefixIcon: GestureDetector(
              onTap: onRemoveTap,
              child: Icon(
                Icons.remove,
                color: count > 0
                    ? const Color(0xFF20473E).withOpacity(0.75)
                    : Colors.grey,
              ),
            ),
            fillColor: color ?? Colors.grey,
            filled: true,
            suffixIcon: GestureDetector(
              onTap: onAddTap,
              child: Icon(
                Icons.add,
                color: count < maxCount
                    ? const Color(0xFF20473E).withOpacity(0.75)
                    : Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
