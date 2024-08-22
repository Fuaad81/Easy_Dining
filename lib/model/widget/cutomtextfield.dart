// ignore_for_file: use_key_in_widget_ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final String? hintText;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.contentPadding,
    this.readOnly = false,
    this.hintText,
    this.hintStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      readOnly: readOnly,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        label: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: myColor.fieldbackground,
        contentPadding: contentPadding,
      ),
    );
  }
}
