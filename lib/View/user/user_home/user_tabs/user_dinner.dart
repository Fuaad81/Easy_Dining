// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:flutter/material.dart';

class user_dinnerItem extends StatefulWidget {
   const user_dinnerItem({super.key});

  @override
  State<user_dinnerItem> createState() => _user_dinnerItemState();
}

class _user_dinnerItemState extends State<user_dinnerItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
    );
  }
}