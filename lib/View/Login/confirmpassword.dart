// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class changePassword extends StatefulWidget {
   const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final _newpass = TextEditingController();
  final _newconfirmpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Change Password",
          size: 21.sp,
          color: myColor.textcolor,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 30.h),
              child: Center(
                child: CustomText(
                  text: "Enter new password and\nconform",
                  size: 22.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: SizedBox(
                width: 315.w,
                height: 60.h,
                child: CustomTextFormField(
                  controller: _newpass,
                  labelText: CustomText(
                    text: "new password",
                    size: 18.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(IconlyLight.lock,size: 20.w,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10.h),
              child: SizedBox(
                width:315.w,
                height: 60.h,
                child: CustomTextFormField(
                  controller: _newconfirmpass,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                  labelText: CustomText(
                    text: "confirm password",
                    size: 18.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(IconlyLight.lock,size: 20.w,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(
                            200.w,
                            50.h)),
                        textStyle: WidgetStatePropertyAll(
                            GoogleFonts.poppins(fontSize: 18.sp)),
                      ),
                      child: CustomText(
                        text: "change password",
                        size: 20.sp,
                        color: myColor.background,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
