// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';

class allItem extends StatefulWidget {
  const allItem({super.key});

  @override
  State<allItem> createState() => _allItemState();
}

class _allItemState extends State<allItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return null;
        },
      ),
    );
  }
}
