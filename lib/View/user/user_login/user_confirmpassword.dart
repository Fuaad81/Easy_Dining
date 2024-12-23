// ignore_for_file: prefer__ructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_confirmPassword extends StatefulWidget {
  const user_confirmPassword({super.key});

  @override
  State<user_confirmPassword> createState() => _user_confirmPasswordState();
}

class _user_confirmPasswordState extends State<user_confirmPassword> {
  final _newpass = TextEditingController();
  final _newconfirmpass = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Change Password",
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
                  text: "Enter new password and\nconform",
                  size: 22.spMin,
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
                height: 50.h,
                child: CustomTextFormField(
                  filled: true,
                  style: GoogleFonts.poppins(color: myColor.textcolor),
                  fillColor: myColor.fieldbackground,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                  controller: _newpass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else if (!RegExp(r'^(?=.*[A-Z][a-z])(?=.*\d)')
                        .hasMatch(value)) {
                      return 'Password must use at least one uppercase letter and numbers';
                    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                        .hasMatch(value)) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                  labelText: CustomText(
                    text: "new password",
                    size: 18.spMin,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  // labelStyle: GoogleFonts.poppins(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w500,
                  //     color: myColor.textcolor),
                  prefixIcon: const Icon(
                    IconlyLight.lock,
                    size: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SizedBox(
                width: 315.w,
                height: 50.h,
                child: CustomTextFormField(
                  filled: true,
                  style: GoogleFonts.poppins(color: myColor.textcolor),
                  fillColor: myColor.fieldbackground,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                  controller: _newconfirmpass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter password';
                    } else if (_newpass.text != _newconfirmpass.text) {
                      return "password don't same";
                    }
                    return null;
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  labelText: CustomText(
                    text: "confirm password",
                    size: 18.spMin,
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
                    IconlyLight.lock,
                    size: 25,
                  ),
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
                          try {
                            final user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              await user.updatePassword(_newpass.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Password updated successfully")),
                              );
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(user.uid)
                                  .update({"password": _newpass.text});
                              Navigator.pushNamed(context, "/user_login");
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: ${e.toString()}")),
                            );
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(200.w, 45.h)),
                      ),
                      child: CustomText(
                        text: "change password",
                        size: 20.spMin,
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
