import 'package:easy_dine_in/Providers/suffixicon_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class user_loginPage extends StatefulWidget {
  const user_loginPage({super.key});

  @override
  State<user_loginPage> createState() => _user_loginPageState();
}

class _user_loginPageState extends State<user_loginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final suffixicons = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: myColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                "assets/images/login.png",
                width: 350.w,
                height: 300.h,
              )),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: CustomText(
                  text: 'Welcome Back!',
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
                padding: EdgeInsets.only(left: 20.w),
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
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: SizedBox(
                  width: 315.w,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                    controller: emailcontroller,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    labelText: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: CustomText(
                        text: "email or phone",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
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
                      size: 20,
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: SizedBox(
                  width: 315.w,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                    obscureText: suffixicons.checked,
                    controller: passwordcontroler,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    labelText: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: CustomText(
                        text: "password",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
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
                      size: 25,
                    ),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myColor.textcolor),
                    suffixIcon: IconButton(
                        onPressed: () {
                          suffixicons.checking();
                        },
                        icon: suffixicons.checked
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                size: 25,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                size: 20.w,
                              )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/user_forgot");
                      },
                      child: CustomText(
                        text: "Forgot Password?",
                        size: 18,
                        color: myColor.linktext,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
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
                        Navigator.pushNamed(context, "/user_bottomnav");
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                        backgroundColor:
                            WidgetStateProperty.all(myColor.maincolor),
                        foregroundColor:
                            WidgetStateProperty.all(myColor.background),
                        minimumSize: WidgetStateProperty.all(Size(200.w, 45.h)),
                      ),
                      child: CustomText(
                        text: "login",
                        size: 20,
                        color: myColor.background,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "i don't have any account!",
                      size: 18,
                      color: myColor.textcolor,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/user_register');
                        },
                        child: CustomText(
                          text: "sign up",
                          size: 20,
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
                padding: EdgeInsets.only(top: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Divider(
                        height: 20.h,
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
                      width: 100.w,
                      child: Divider(
                        height: 20.h,
                        thickness: 2,
                        indent: 10,
                        color: myColor.textcolor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
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
                          width: 50.w,
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
