// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class accountSetting extends StatefulWidget {
   const accountSetting({super.key});

  @override
  State<accountSetting> createState() => _accountSettingState();
}

class _accountSettingState extends State<accountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: CustomText(
          text: "Account Settings",
          size: 24.sp,
          color: myColor.textcolor,
          weight: FontWeight.w400,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Center(
              child: CircleAvatar(
                backgroundColor: myColor.tabcolor,
                radius: 50.r,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.h),
            child: Center(
              child:CustomText(
                        text: "Name",
                        size: 22.sp,
                        color: myColor.textcolor,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.h),
            child: Center(
              child:CustomText(
                        text: "sample@gmail.com",
                        size: 18.sp,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      ),
            ),
          ),
          
        ],
      ),
    );
  }
}
