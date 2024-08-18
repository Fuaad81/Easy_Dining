// ignore_for_file: camel_case_types, prefer_const_constructors, annotate_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash_screeen extends StatefulWidget {
  const Splash_screeen({super.key});

  @override
  State<Splash_screeen> createState() => _Splash_screeenState();
}

class _Splash_screeenState extends State<Splash_screeen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, "/firstonboard"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF5B00),
      body: Center(
        child: Image.asset(
          "assets/images/app_logo.png",
          width: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(400),
        ),
      ),
    );
  }
}
