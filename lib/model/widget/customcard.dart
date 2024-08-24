import 'package:flutter/material.dart';

class customCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry? margin;
  final ShapeBorder? shape;
  const customCard(
      {super.key,
      required this.child,
      this.color,
      this.elevation,
      this.shadowColor,
      this.margin,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      shadowColor: shadowColor,
      margin: margin,
      shape: shape,
      child: child,
      
    );
  }
}
