// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';

class dinnerItem extends StatefulWidget {
  const dinnerItem({super.key});

  @override
  State<dinnerItem> createState() => _dinnerItemState();
}

class _dinnerItemState extends State<dinnerItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
    );
  }
}