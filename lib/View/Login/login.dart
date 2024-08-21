// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                    child: LottieBuilder.network(
                  repeat: false,
                  "https://lottie.host/fbc237c1-ec53-435f-9575-2f31013f6120/Z9dkIXS2kG.json",
                  width: ScreenUtil().setWidth(350),
                  height: ScreenUtil().setHeight(250),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(
                  text: 'Wellcome Back!',
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.poppins(
                    letterSpacing: 1.05,
                  ),
                  size: 27,
                  weight: FontWeight.w700,
                  color: myColor.textcolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(
                  text: 'Sign in to continue...',
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.poppins(),
                  size: 20,
                  weight: FontWeight.w300,
                  color: myColor.textcolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: SizedBox(
                  width: ScreenUtil().setWidth(315),
                  height: ScreenUtil().setHeight(44),
                  child: CustomTextFormField(
                    controller: textEditingController,
                    labelText: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CustomText(
                        text: "email or phone",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'enter email correctly';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      color: myColor.textcolor,
                      size: 30,
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: SizedBox(
                  width: ScreenUtil().setWidth(315),
                  height: ScreenUtil().setHeight(44),
                  child: CustomTextFormField(
                    controller: textEditingController,
                    labelText: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CustomText(
                        text: "password",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'password incorrect';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      IconlyLight.lock,
                      color: myColor.textcolor,
                      size: 35,
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye_outlined)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/forgot");
                        },
                        child: CustomText(
                        text: "forgot password?",
                        size: 18,
                        color: myColor.linktext,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bottomnav");
                      },
                      child: CustomText(
                        text: "Submit",
                        size: 20,
                        color: myColor.background,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        fixedSize: WidgetStatePropertyAll(Size(
                            ScreenUtil().setWidth(200),
                            ScreenUtil().setHeight(45))),
                        textStyle: WidgetStatePropertyAll(
                            GoogleFonts.poppins(fontSize: 18)),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "i don't have any account!",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: CustomText(
                        text: "sign up",
                        size: 20,
                        color: myColor.linktext,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(120),
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
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                    SizedBox(
                      width: ScreenUtil().setWidth(120),
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
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(40),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/ic_facebook.png",
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(40),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
