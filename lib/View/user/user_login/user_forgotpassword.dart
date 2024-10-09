// ignore_for_file: prefer__ructors

import 'dart:math';

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/style/customtheme.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _formkey = GlobalKey<FormState>();

  Future<bool> verifyEmail(String email) async {
    try {
      var querysnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .where("email", isEqualTo: email)
          .get();
      return querysnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking email: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Forgot Password",
          size: 21.spMin,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Center(
                  child: CustomText(
                    text:
                        "Please enter your email correctly\nand reset your password",
                    size: 20.spMin,
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
                    style: GoogleFonts.poppins(color: myColor.textcolor),
                    fillColor: lightTheme.scaffoldBackgroundColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    controller: _forgotpass,
                    labelText: CustomText(
                      text: "enter your email",
                      size: 18.spMin,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter email address';
                      }
                      return null;
                    },
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
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            bool emailexist =
                                await verifyEmail(_forgotpass.text);
                            if (emailexist) {
                              Navigator.pushNamed(context, "/user_confirmpass");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: const Text("email not found")),
                              );
                            }
                          }
                          // Navigator.pushNamed(context, "/user_otp");
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                          backgroundColor:
                              WidgetStatePropertyAll(myColor.maincolor),
                          foregroundColor:
                              WidgetStatePropertyAll(myColor.background),
                          minimumSize:
                              WidgetStateProperty.all(Size(200.w, 45.h)),
                          textStyle: WidgetStatePropertyAll(
                              GoogleFonts.poppins(fontSize: 18)),
                        ),
                        child: CustomText(
                          text: "send OTP",
                          size: 20.spMin,
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
