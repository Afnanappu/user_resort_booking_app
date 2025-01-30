import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.width,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTapOutside,
    this.onTap,
    this.onChanged,
    this.prefix,
  });
  final double? width;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final void Function()? onTapOutside;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        enabled: enabled,
        readOnly: readOnly,
        minLines: 1,
        onChanged: onChanged,
        maxLines: maxLines,
        onTap: onTap,
        onTapOutside: (_) {
          if (onTapOutside != null) {
            onTapOutside!();
          }
          FocusScope.of(context).unfocus();
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: validator,
        cursorColor: MyColors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          prefixIcon: prefix,
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.grey,
              style: BorderStyle.solid,
              width: 5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.grey,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.orange,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.error,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
