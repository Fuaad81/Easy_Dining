import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final TextOverflow? textOverflow;
  final Color? color;
  final double? letterSpacing;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<Shadow>? shadow;
  const CustomText({
    required this.text,
    required this.size,
    this.weight,
    this.color,
    this.letterSpacing,
    super.key,
    this.textAlign,
    this.textStyle,
    this.textOverflow,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: size,
              fontWeight: weight,
              color: color,
              letterSpacing: letterSpacing,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              decorationThickness: decorationThickness,
              shadows: shadow)),
    );
  }
}
