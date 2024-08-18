// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget labelText;
  final TextStyle labelStyle;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  CustomTextFormField({
    required this.controller,
    required this.labelText,
    required this.labelStyle,
    required this.prefixIcon,
    required this.suffixIcon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: labelText,
        labelStyle: labelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Color(0xFFB6B7B7),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}