import 'package:easy_dine_in/model/style/color.dart';
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
                child: Text(
                  'Wellcome Back!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: myColor.textcolor,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.08,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Sign in to continue...',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: myColor.textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    height: 0,
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
                      child: Text("email or phone"),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'enter email correctly';
                      }
                      return null;
                    },
                    prefixIcon: Container(
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                        color: myColor.maincolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        CupertinoIcons.mail,
                        color: myColor.background,
                        size: 30,
                      ),
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    suffixIcon: Icon(null),
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
                      child: Text("password"),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'password incorrect';
                      }
                      return null;
                    },
                    prefixIcon: Container(
                      width: ScreenUtil().setWidth(20),
                      decoration: BoxDecoration(
                        color: myColor.maincolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        IconlyLight.lock,
                        color: myColor.background,
                        size: 35,
                      ),
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
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: myColor.linktext,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("submit"),
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        fixedSize: WidgetStatePropertyAll(Size(
                            ScreenUtil().setWidth(200),
                            ScreenUtil().setHeight(40))),
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
                    Text(
                      "i don't have an account!",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
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
                      width: 120,
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
                      width: 120,
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
        ),
      ),
    );
  }
}
