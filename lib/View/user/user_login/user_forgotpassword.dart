// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class user_forgotPassword extends StatefulWidget {
  const user_forgotPassword({super.key});

  @override
  State<user_forgotPassword> createState() => _user_forgotPasswordState();
}

class _user_forgotPasswordState extends State<user_forgotPassword> {
  final _forgotpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: CustomText(
          text: "Forgot Password",
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
            padding: EdgeInsets.only(top: 30.h),
            child: Center(
              child: CustomText(
                text:
                    "Please enter your email correctly\nand reset your password",
                size: 20,
                color: myColor.textcolor,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              width: 315.w,
              child: CustomTextFormField(
                filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                controller: _forgotpass,
                labelText: CustomText(
                  text: "enter your email",
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
                prefixIcon: const Icon(
                  CupertinoIcons.mail,
                  size: 20,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/user_otp");
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                      backgroundColor:
                          WidgetStatePropertyAll(myColor.maincolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStateProperty.all(Size(200.w, 45.h)),
                      textStyle: WidgetStatePropertyAll(
                          GoogleFonts.poppins(fontSize: 18)),
                    ),
                    child: CustomText(
                      text: "send OTP",
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
      )),
    );
  }
}
