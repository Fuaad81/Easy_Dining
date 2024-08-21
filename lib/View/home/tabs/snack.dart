// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';

class snackItem extends StatefulWidget {
   const snackItem({super.key});

  @override
  State<snackItem> createState() => _snackItemState();
}

class _snackItemState extends State<snackItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
    );
  }
}