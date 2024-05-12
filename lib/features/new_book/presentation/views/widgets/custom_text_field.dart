import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hint, required this.textName, required this.controller, this.readOnly, this.onTap,
  });
  final String hint;
  final String textName;
  final TextEditingController controller ;
  final bool? readOnly;
  final void Function()?  onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textName,
          style: TextStyle(
              fontSize: 24.w(context), fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 32.h(context),
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly ?? false,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w(context), vertical: 20.h(context)),
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFA4A4A4)),
              borderRadius: BorderRadius.circular(10.w(context)),
            ),
            fillColor: const Color(0xFFF5F5F5),
            filled: true,
          ),
        )
      ],
    );
  }
}
