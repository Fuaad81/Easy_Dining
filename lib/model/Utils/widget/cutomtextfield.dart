// ignore_for_file: use_key_in_widget_ructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLines;
  final InputBorder? border;
  final Color? fillColor;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.contentPadding,
    this.readOnly = false,
    this.hintText,
    this.hintStyle, this.maxLines =1, this.border, this.fillColor, this.filled
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(

        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        label: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        border: border,
        filled: filled,
        fillColor: fillColor,
        contentPadding: contentPadding,
      ),
    );
  }
}
