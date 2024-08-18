// ignore_for_file: camel_case_types, prefer_const_constructors

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
        onFinish: (){
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
                  child: Text(
                    "Fresh Food",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Order anytime you want.We\nguarantee to provide you quality\nfood.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    "Order Your Food",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Browse the menu and order directly\nfrom the application.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    "Fastest Delivery",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'We will delivery your order as quickly\n and efficiently as possible',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
