// ignore_for_file: camel_case_types, prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
    const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: const Color(0xffffffff),
        pageBackgroundColor: const Color(0xffffffff),
        centerBackground: true,
        background: [
          Padding(
            padding:  EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/image.png",
                width: 300.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/orderfood.jpg",
                width: 300.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 50.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/fast_delivery.jpg",
                width: 300.w,
              ),
            ),
          ),
        ],
        skipTextButton: Text(
          "skip",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp),
        ),
        finishButtonText: "Get Start",
        finishButtonStyle:  const FinishButtonStyle(
            backgroundColor: Color(0xFFFF5B00), foregroundColor: Colors.white),
        finishButtonTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: 0,
          letterSpacing: 0.36,
        ),
        onFinish: () {
          Navigator.pushReplacementNamed(context, "/login");
        },
        speed: 1.8,
        controllerColor:  const Color(0xFFFF5B00),
        pageBodies: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 200.h),
                  child: CustomText(
                    text: "Fresh Food",
                    textStyle: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                    size: 27.sp,
                    weight: FontWeight.w700,
                    color: myColor.textcolor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: CustomText(
                        text:
                            "Order anytime you want.We\nguarantee to provide you quality\nfood.",
                        size: 17.sp,
                        textStyle:  const TextStyle(),
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
                  padding: EdgeInsets.only(top: 250.h),
                  child: CustomText(
                    text: "Order Your Food",
                    textStyle: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.08,
                    ),
                    size: 27.sp,
                    weight: FontWeight.w700,
                    color: myColor.textcolor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: CustomText(
                        text:
                            "Browse the menu and order\ndirectly from the application.",
                        size: 17.sp,
                        textStyle:  const TextStyle(),
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
                  padding: EdgeInsets.only(top: 250.h),
                  child: CustomText(
                    text: "Fastest Delivery",
                    textStyle: GoogleFonts.poppins(
                      letterSpacing: 1.08,
                    ),
                    size: 27.sp,
                    weight: FontWeight.w700,
                    color: myColor.textcolor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: CustomText(
                        text:
                            "We will delivery your order as quickly\n and efficiently as possible.",
                        size: 17.sp,
                        textStyle:  const TextStyle(),
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center)
                ),
              ],
            ),
          ),
        ]);
  }
}
