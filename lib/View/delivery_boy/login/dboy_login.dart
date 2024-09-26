import 'dart:ui';

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class dboy_Login extends StatefulWidget {
  const dboy_Login({super.key});

  @override
  State<dboy_Login> createState() => _dboy_LoginState();
}

class _dboy_LoginState extends State<dboy_Login> {
  var emailcontroller = TextEditingController();
  var passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/deliveryboy.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.black.withOpacity(0), // Optional: add transparency
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 200.h),
                  child: CustomText(
                    text: 'Welcome Back!',
                    color: myColor.background,
                    size: 27.spMin,
                    weight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: CustomText(
                    text: 'Sign in to continue...',
                    color: myColor.background,
                    size: 20.spMin,
                    weight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: SizedBox(
                    width: 335.w,
                    child: CustomTextFormField(
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      controller: emailcontroller,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      labelText: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: CustomText(
                          text: "email or phone",
                          size: 18.spMin,
                          weight: FontWeight.w400,
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'enter email correctly';
                        }
                        return null;
                      },
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: myColor.textcolor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: SizedBox(
                    width: 335.w,
                    child: CustomTextFormField(
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      controller: passwordcontroler,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      labelText: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: CustomText(
                          text: "password",
                          size: 18.spMin,
                          weight: FontWeight.w400,
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'password incorrect';
                        }
                        return null;
                      },
                      
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: myColor.textcolor),
                      suffixIcon: IconButton(
                          color: myColor.textcolor,
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.show,
                            size: 20.w,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/db_forgotpassword");
                        },
                        child: CustomText(
                          text: "forgot password?",
                          size: 18.spMin,
                          color: myColor.maincolor,
                          weight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/db_bottombar");
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
                            minimumSize:
                                WidgetStateProperty.all(Size(200.w, 50.h)),
                          ),
                          child: CustomText(
                            text: "login",
                            size: 20.spMin,
                            color: myColor.background,
                            weight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "i don't have any account!",
                        size: 18.spMin,
                        weight: FontWeight.w400,
                        color: myColor.background,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/db_register');
                          },
                          child: CustomText(
                            text: "sign up",
                            size: 20.spMin,
                            color: myColor.maincolor,
                            weight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Divider(
                          color: myColor.background,
                          height: 20.h,
                          thickness: 2,
                          endIndent: 10.w,
                        ),
                      ),
                      CustomText(
                        text: "or login with",
                        size: 18.spMin,
                        weight: FontWeight.w400,
                        color: myColor.background,
                      ),
                      SizedBox(
                        width: 100.w,
                        child: Divider(
                          color: myColor.background,
                          height: 20.h,
                          thickness: 2,
                          indent: 10.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
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
          )
        ],
      ),
    );
  }
}
