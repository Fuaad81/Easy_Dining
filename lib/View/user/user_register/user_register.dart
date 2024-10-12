// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/Controllers/userController/auth_controller/user_register_controller.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/style/customtheme.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:easy_dine_in/model/service_model/userModel/auth/user_register_model.dart';
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
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _locationcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _cpasswordcontroller = TextEditingController();
  final User_RegisterController _userController = User_RegisterController();
  var terms = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formkey,
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
                  size: 28.spMin,
                  weight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: CustomText(
                  text: "create your account",
                  size: 20.spMin,
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
                    style: GoogleFonts.poppins(color: myColor.textcolor),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    controller: _namecontroller,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    labelText: CustomText(
                      text: "name",
                      size: 18.spMin,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(IconlyLight.profile,
                        size: 25, color: myColor.textcolor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                child: SizedBox(
                  width: 315.w,
                  child: CustomTextFormField(
                    style: GoogleFonts.poppins(color: myColor.textcolor),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    controller: _emailcontroller,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    labelText: CustomText(
                      text: "email",
                      size: 18.spMin,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return "enter email correctly";
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
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                child: SizedBox(
                  width: 315.w,
                  child: CustomTextFormField(
                    style: GoogleFonts.poppins(color: myColor.textcolor),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    controller: _numbercontroller,
                    labelText: CustomText(
                      text: "number",
                      size: 18.spMin,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter valid number";
                      }
                      return null;
                    },
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
                    style: GoogleFonts.poppins(color: myColor.textcolor),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    controller: _locationcontroller,
                    labelText: CustomText(
                      text: "Address",
                      size: 18.spMin,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter valid address";
                      }
                      return null;
                    },
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      color: myColor.textcolor,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(IconlyLight.location)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                child: SizedBox(
                  width: 315.w,
                  child: CustomTextFormField(
                    style: GoogleFonts.poppins(color: myColor.textcolor),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    controller: _passwordcontroller,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    labelText: CustomText(
                      text: "password",
                      size: 18.spMin,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter valid password";
                      }
                      return null;
                    },
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      IconlyLight.lock,
                      color: myColor.textcolor,
                      size: 25,
                    ),
                    errorStyle: GoogleFonts.poppins(color: myColor.errortext),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 25,
                      color: myColor.textcolor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                child: SizedBox(
                  width: 315.w,
                  child: CustomTextFormField(
                      style: GoogleFonts.poppins(color: myColor.textcolor),
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: _cpasswordcontroller,
                      errorStyle: GoogleFonts.poppins(color: myColor.errortext),
                      labelText: CustomText(
                        text: "confirm password",
                        size: 18.spMin,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      ),
                      validator: (value) {
                        if (_cpasswordcontroller == value) {
                          return "password do not match";
                        }

                        if (value == null || value.isEmpty) {
                          return "enter valid password";
                        }
                        return null;
                      },
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: myColor.textcolor),
                      prefixIcon: Icon(
                        IconlyLight.lock,
                        color: myColor.textcolor,
                        size: 25,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 25,
                        color: myColor.textcolor,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: myColor.maincolor,
                      value: terms,
                      onChanged: (value) {
                        setState(() {
                          terms = value!;
                        });
                        if (terms == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: CustomText(
                                  text: "you must accept terms & condition",
                                  size: 18.spMin)));
                        }
                      },
                    ),
                    CustomText(
                      text: "I Agree with",
                      size: 16.spMin,
                      weight: FontWeight.w400,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: InkWell(
                        onTap: () {},
                        child: CustomText(
                          text: "Terms & Conditions",
                          size: 16.spMin,
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
                        if (_formkey.currentState!.validate() && terms) {
                          user_Register_Model userreg = user_Register_Model(
                            name: _namecontroller.text,
                            email: _emailcontroller.text,
                            number: _numbercontroller.text,
                            address: _locationcontroller.text,
                            password: _passwordcontroller.text,
                            confirmPassword: _cpasswordcontroller.text,
                            terms: terms,
                          );

                          _userController.registerUser(userreg, context);
                          // _namecontroller.clear();
                          // _emailcontroller.clear();
                          // _numbercontroller.clear();
                          // _passwordcontroller.clear();
                          // _cpasswordcontroller.clear();
                        }
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStatePropertyAll(lightTheme.primaryColor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(200.w, 45.h)),
                      ),
                      child: CustomText(
                        text: "Register",
                        size: 20.spMin,
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
                      size: 18.spMin,
                      weight: FontWeight.w400,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/user_login');
                        },
                        child: CustomText(
                          text: "Login",
                          size: 18.spMin,
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
                        endIndent: 10.w,
                        color: lightTheme.scaffoldBackgroundColor,
                      ),
                    ),
                    CustomText(
                      text: "or login with",
                      size: 18.spMin,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: Divider(
                        height: 20,
                        thickness: 2,
                        indent: 10.w,
                        color: lightTheme.scaffoldBackgroundColor,
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
                          width: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/ic_facebook.png",
                            width: 50))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
