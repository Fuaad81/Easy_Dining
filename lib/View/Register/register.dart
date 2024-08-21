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
      backgroundColor: myColor.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Lottie.network(
                  "https://lottie.host/6cc1ba76-c106-47c8-848e-283e6896bb34/r6lsx72mm2.json",
                  width: ScreenUtil().setWidth(250),
                  height: ScreenUtil().setHeight(250),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(
                text: "Sign Up",
                size: 28,
                color: myColor.textcolor,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
                textStyle: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: CustomText(
                text: "create your account",
                size: 20,
                color: myColor.textcolor,
                weight: FontWeight.w300,
                textAlign: TextAlign.center,
                textStyle: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _namecontroller,
                  labelText: CustomText(
                    text: "name",
                    size: 20,
                    color: myColor.textcolor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    CupertinoIcons.person,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _emailcontroller,
                  labelText: CustomText(
                    text: "email",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: myColor.textcolor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _numbercontroller,
                  labelText: CustomText(
                    text: "number",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                    color: myColor.textcolor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _passwordcontroller,
                  labelText: CustomText(
                    text: "password",
                    size: 18,
                    color: myColor.textcolor,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(
                    IconlyLight.lock,
                    color: myColor.textcolor,
                    size: 30,
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                    controller: _cpasswordcontroller,
                    labelText: CustomText(
                      text: "confirm password",
                      size: 18,
                      color: myColor.textcolor,
                      weight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(),
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      IconlyLight.lock,
                      color: myColor.textcolor,
                      size: 30,
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: check,
                    onChanged: (value) {},
                  ),
                  CustomText(
                    text: "I Agree with",
                    size: 16,
                    color: myColor.textcolor,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Terms & Conditions",
                      size: 16,
                      color: myColor.linktext,
                      weight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(),
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
                    child: CustomText(
                        text: "Register",
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
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                        text: "Allready have an account?",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: CustomText(
                        text: "Login",
                        size: 18,
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
                      icon: Image.network(
                        "https://img.icons8.com/?size=100&id=V5cGWnc9R4xj&format=png&color=000000",
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setHeight(40),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.network(
                        "https://img.icons8.com/?size=100&id=118497&format=png&color=000000",
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setHeight(40),
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
