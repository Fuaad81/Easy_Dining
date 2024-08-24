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
      appBar: AppBar(
        title: CustomText(
          text: "Account Settings",
          size: 24.sp,
          color: myColor.textcolor,
          weight: FontWeight.w400,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: myColor.tabcolor,
                  radius: 50.r,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Center(
                child: CustomText(
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
              padding: EdgeInsets.only(top: 5.h),
              child: Center(
                child: CustomText(
                  text: "sample@gmail.com",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Edit Profile",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Change Password",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Payment Method",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Theme",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "About",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Terms & Condition",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Invite Friends",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  const Icon(Icons.logout_rounded),
                  CustomText(
                    text: "Log Out",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.textcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  CustomText(
                    text: "Delete Account",
                    size: 20.sp,
                    weight: FontWeight.w400,
                    color: myColor.errortext,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
