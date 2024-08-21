// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class First_Onboarding extends StatefulWidget {
  const First_Onboarding({super.key});

  @override
  State<First_Onboarding> createState() => _First_OnboardingState();
}

class _First_OnboardingState extends State<First_Onboarding> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: Color(0xffffffff),
        pageBackgroundColor: Color(0xffffffff),
        centerBackground: true,
        background: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/image.png",
                width: ScreenUtil().setWidth(300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/orderfood.jpg",
                width: ScreenUtil().setWidth(300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/fast_delivery.jpg",
                width: ScreenUtil().setWidth(300),
              ),
            ),
          ),
        ],
        skipTextButton: Text(
          "skip",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
        ),
        finishButtonText: "Get Start",
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: Color(0xFFFF5B00), foregroundColor: Colors.white),
        finishButtonTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 0,
          letterSpacing: 0.36,
        ),
        onFinish: () {
          Navigator.pushNamed(context, "/login");
        },
        speed: 1.8,
        controllerColor: Color(0xFFFF5B00),
        pageBodies: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: CustomText(
                    text: "Fresh Food",
                    textStyle: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                    size: 27,
                    weight: FontWeight.w700,
                    color: myColor.textcolor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CustomText(
                        text:
                            "Order anytime you want.We\nguarantee to provide you quality\nfood.",
                        size: 17,
                        textStyle: TextStyle(),
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center)),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: CustomText(
                    text: "Order Your Food",
                    textStyle: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                    size: 27,
                    weight: FontWeight.w700,
                    color: myColor.textcolor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CustomText(
                        text:
                            "Browse the menu and order\ndirectly from the application.",
                        size: 17,
                        textStyle: TextStyle(),
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center)),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: CustomText(
                    text: "Fastest Delivery",
                    textStyle: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                    size: 27,
                    weight: FontWeight.w700,
                    color: myColor.textcolor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomText(
                        text:
                            "We will delivery your order as quickly\n and efficiently as possible.",
                        size: 17,
                        textStyle: TextStyle(),
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center)
                ),
              ],
            ),
          ),
        ]);
  }
}
