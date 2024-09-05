// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_accountSetting extends StatefulWidget {
  const user_accountSetting({super.key});

  @override
  State<user_accountSetting> createState() => _user_accountSettingState();
}

class _user_accountSettingState extends State<user_accountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: CustomText(
          text: "Account Settings",
          size: 24,
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
                  size: 22,
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
                  size: 20,
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
                  Image.asset(
                    "assets/icons/ic_edit_profile.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Edit Profile",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_change_password.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Change Password",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_payment.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Payment Method",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_theme.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Theme",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_about.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "About",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_terms.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Terms & Condition",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_invite_friends.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Invite Friends",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_logout.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Log Out",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_delete.png",
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CustomText(
                      text: "Delete Account",
                      size: 20,
                      weight: FontWeight.w400,
                      color: myColor.errortext,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 25.w,
              indent: 25.w,
            )
          ],
        ),
      ),
    );
  }
}
