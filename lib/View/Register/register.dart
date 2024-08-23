// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
    const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              padding:  EdgeInsets.only(top: 10.h),
              child: Center(
                child: Lottie.network(
                  "https://lottie.host/6cc1ba76-c106-47c8-848e-283e6896bb34/r6lsx72mm2.json",
                  width: 250.w,
                  height: 250.h,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: CustomText(
                text: "Sign Up",
                size: 28.sp,
                color: myColor.textcolor,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
                textStyle:  const TextStyle(),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w, top: 10.h),
              child: CustomText(
                text: "create your account",
                size: 20.sp,
                color: myColor.textcolor,
                weight: FontWeight.w300,
                textAlign: TextAlign.center,
                textStyle:  const TextStyle(),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w, top: 10.h),
              child: SizedBox(
                width: 315.w,
                height: 50.h,
                child: CustomTextFormField(
                  controller: _namecontroller,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  labelText: CustomText(
                    text: "name",
                    size: 18.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle:  const TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon:  Icon(
                    CupertinoIcons.person,
                    size: 20.w,
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w, top: 10.h),
              child: SizedBox(
                width: 315.w,
                height: 50.h,
                child: CustomTextFormField(
                  controller: _emailcontroller,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  labelText: CustomText(
                    text: "email",
                    size: 18.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle:  const TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: myColor.textcolor,
                    size: 20.w,
                  ),
                ),
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(left: 20.w, top: 10.h),
              child: SizedBox(
                width: 315.w,
                height: 50.h,
                child: CustomTextFormField(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  controller: _numbercontroller,
                  labelText: CustomText(
                    text: "number",
                    size: 18.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle:  const TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                    color: myColor.textcolor,
                    size: 20.w,
                  ),
                ),
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(left: 20.w, top: 10.h),
              child: SizedBox(
                width: 315.w,
                height: 50.h,
                child: CustomTextFormField(
                  controller: _passwordcontroller,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  labelText: CustomText(
                    text: "password",
                    size: 18.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle:  const TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    IconlyLight.lock,
                    color: myColor.textcolor,
                    size: 20.w,
                  ),
                  suffixIcon:  Icon(Icons.remove_red_eye_outlined,size: 20.w,),
                ),
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(left: 20.w, top: 10.h),
              child: SizedBox(
                width:315.w,
                height:50.h,
                child: CustomTextFormField(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                    controller: _cpasswordcontroller,
                    labelText: CustomText(
                      text: "confirm password",
                      size: 18.sp,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle:  const TextStyle(),
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      IconlyLight.lock,
                      color: myColor.textcolor,
                      size: 20.w,
                    ),
                    suffixIcon:  Icon(Icons.remove_red_eye_outlined,size: 20.w,)),
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: myColor.maincolor,
                    value: check,
                    onChanged: (value) {},
                  ),
                  CustomText(
                    text: "I Agree with",
                    size: 16.sp,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle:  const TextStyle(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: "Terms & Conditions",
                        size: 16.sp,
                        color: myColor.linktext,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle:  const TextStyle(),
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
                      Navigator.pushNamed(context, "/createsuccess");
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                      backgroundColor:
                          WidgetStatePropertyAll(myColor.maincolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStatePropertyAll(Size(
                          200.w,
                          45.h)),
                      
                    ),
                    child: CustomText(
                        text: "Register",
                        size: 20.sp,
                        color: myColor.background,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle:  const TextStyle(),
                      )),
              ],
            ),
            Padding(
              padding:   EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                        text: "Allready have an account?",
                        size: 18.sp,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle:  const TextStyle(),
                      ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: CustomText(
                          text: "Login",
                          size: 18.sp,
                          color: myColor.linktext,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          textStyle:  const TextStyle(),
                        ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:   EdgeInsets.only(top: 10.h),
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
                        size: 18.sp,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle:  const TextStyle(),
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
              padding:   const EdgeInsets.only(top: 10),
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
                      icon: Image.asset(
                        "assets/icons/ic_facebook.png",
                        width: 50.w
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
