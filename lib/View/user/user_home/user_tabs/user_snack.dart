// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:flutter/material.dart';

class user_snackItem extends StatefulWidget {
   const user_snackItem({super.key});

  @override
  State<user_snackItem> createState() => _user_snackItemState();
}

class _user_snackItemState extends State<user_snackItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
    );
  }
}