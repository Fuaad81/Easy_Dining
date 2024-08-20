import 'package:easy_dine_in/model/style/color.dart';
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
              child: Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "create your account",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                    controller: _namecontroller,
                    labelText: Text("name"),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      size: 30,
                    ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                    controller: _emailcontroller,
                    labelText: Text("email"),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      color: myColor.textcolor,
                      size: 30,
                    ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                    controller: _numbercontroller,
                    labelText: Text("number"),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      color: myColor.textcolor,
                      size: 30,
                    ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _passwordcontroller,
                  labelText: Text("password"),
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
                    labelText: Text("confirm password"),
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
                  Text(
                    "I Agree with",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms & Conditions",
                        style: GoogleFonts.poppins(
                            color: myColor.linktext,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ))
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
                    child: Text("Register"),
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
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
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
                  Text(
                    "or login with",
                    style: GoogleFonts.poppins(fontSize: 18),
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
