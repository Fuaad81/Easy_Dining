// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';

class breakFast extends StatefulWidget {
  const breakFast({super.key});

  @override
  State<breakFast> createState() => _breakFastState();
}

class _breakFastState extends State<breakFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
    );
  }
}