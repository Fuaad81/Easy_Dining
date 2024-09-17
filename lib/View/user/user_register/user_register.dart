// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_Register extends StatefulWidget {
  const user_Register({super.key});

  @override
  State<user_Register> createState() => _user_RegisterState();
}

class _user_RegisterState extends State<user_Register> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _cpasswordcontroller = TextEditingController();
  final check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Center(
                child: Image.asset(
                  "assets/images/register.png",
                  width: 250.w,
                  height: 250.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: CustomText(
                text: "Sign Up",
                size: 28,
                color: myColor.textcolor,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: CustomText(
                text: "create your account",
                size: 20,
                color: myColor.textcolor,
                weight: FontWeight.w300,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 15.h),
              child: SizedBox(
                width: 315.w,
                
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                  controller: _namecontroller,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  labelText: CustomText(
                    text: "name",
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
                    IconlyLight.profile,
                    size: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 15.h),
              child: SizedBox(
                width: 315.w,
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                  controller: _emailcontroller,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  labelText: CustomText(
                    text: "email",
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
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: myColor.textcolor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 15.h),
              child: SizedBox(
                width: 315.w,
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  controller: _numbercontroller,
                  labelText: CustomText(
                    text: "number",
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
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                    color: myColor.textcolor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 15.h),
              child: SizedBox(
                width: 315.w,
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                  controller: _passwordcontroller,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  labelText: CustomText(
                    text: "password",
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
                  prefixIcon: Icon(
                    IconlyLight.lock,
                    color: myColor.textcolor,
                    size: 25,
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_outlined,
                    size: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 15.h),
              child: SizedBox(
                width: 315.w,
                child: CustomTextFormField(
                  filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    controller: _cpasswordcontroller,
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
                    prefixIcon: Icon(
                      IconlyLight.lock,
                      color: myColor.textcolor,
                      size: 25,
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 25,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: myColor.maincolor,
                    value: check,
                    onChanged: (value) {},
                  ),
                  CustomText(
                    text: "I Agree with",
                    size: 16,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: "Terms & Conditions",
                        size: 16,
                        color: myColor.linktext,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/user_createsuccess");
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                      backgroundColor:
                          WidgetStatePropertyAll(myColor.maincolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStatePropertyAll(Size(200.w, 45.h)),
                    ),
                    child: CustomText(
                      text: "Register",
                      size: 20,
                      color: myColor.background,
                      weight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Allready have an account?",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/user_login');
                      },
                      child: CustomText(
                        text: "Login",
                        size: 18,
                        color: myColor.linktext,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Divider(
                      height: 20,
                      thickness: 2,
                      endIndent: 10,
                      color: myColor.textcolor,
                    ),
                  ),
                  CustomText(
                    text: "or login with",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Divider(
                      height: 20,
                      thickness: 2,
                      indent: 10,
                      color: myColor.textcolor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/ic_google.png",
                        width: 50.w,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/ic_facebook.png",
                          width: 50.w))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
