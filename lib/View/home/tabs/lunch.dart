// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';

class lunchItem extends StatefulWidget {
   const lunchItem({super.key});

  @override
  State<lunchItem> createState() => _lunchItemState();
}

class _lunchItemState extends State<lunchItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
    );
  }
}