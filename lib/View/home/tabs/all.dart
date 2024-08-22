// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class allItem extends StatefulWidget {
  const allItem({super.key});

  @override
  State<allItem> createState() => _allItemState();
}

class _allItemState extends State<allItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.fieldbackground,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.fieldbackground,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                    ),
                  ),
                ]),
              ),
              Container(
                height: 180.h,
                width: 150.w,
                child: customCard(
                    child: Stack(
                  children: [
                    Image.asset("assets/images/image.png"),
                    Positioned(
                      left: 120.w,
                      
                      child: Icon(Icons.favorite_border_outlined,color: myColor.background,)),
                    Positioned(
                      bottom: 35.h,
                      child: Text("hello"))
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
