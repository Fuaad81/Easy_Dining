import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final Color? color;
  final double? letterSpacing;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
   CustomText({
    required this.text,
    required this.size,
    this.weight,
    this.color,
    this.letterSpacing,
    super.key,this.textAlign, this.textStyle,
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          letterSpacing: letterSpacing,
          
        )
      ),
      
    );
  }
}