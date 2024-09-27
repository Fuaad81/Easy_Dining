import 'dart:ui';

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class dboy_Forgot_Password extends StatefulWidget {
  const dboy_Forgot_Password({super.key});

  @override
  State<dboy_Forgot_Password> createState() => _dboy_Forgot_PasswordState();
}

class _dboy_Forgot_PasswordState extends State<dboy_Forgot_Password> {

  var _forgotpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/deliveryboy.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.black.withOpacity(0), // Optional: add transparency
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: ListTile(
                      
                      leading: InkWell(
                          onTap: () {},
                          child: Icon(
                            IconlyLight.arrow_left_2,
                            color: myColor.background,
                            size: 30,
                          )),
                      title: CustomText(
                        text: "Forgot Password",
                        size: 21.spMin,
                        color: myColor.background,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Center(
                child: CustomText(
                  text:
                      "Please enter your email correctly\nand reset your password",
                  size: 20.spMin,
                  color: myColor.background,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
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
                    size: 18.spMin,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: myColor.textcolor,
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
                        Navigator.pushNamed(context, "/db_otp");
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
                        size: 20.spMin,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
