// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_changePassword extends StatefulWidget {
   const user_changePassword({super.key});

  @override
  State<user_changePassword> createState() => _user_changePasswordState();
}

class _user_changePasswordState extends State<user_changePassword> {
  final _newpass = TextEditingController();
  final _newconfirmpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: CustomText(
          text: "Change Password",
          size: 21,
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
                  size: 22,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: SizedBox(
                width: 315.w,
                height: 50.h,
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                  controller: _newpass,
                  labelText: CustomText(
                    text: "new password",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: const Icon(IconlyLight.lock,size: 25,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10.h),
              child: SizedBox(
                width:315.w,
                height: 50.h,
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                  controller: _newconfirmpass,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  labelText: CustomText(
                    text: "confirm password",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: const Icon(IconlyLight.lock,size: 25,),
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
                        Navigator.pushNamed(context, "/user_login");
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
                            45.h)),
                       
                      ),
                      child: CustomText(
                        text: "change password",
                        size: 20,
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
