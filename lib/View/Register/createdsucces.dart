// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class createdSucces extends StatefulWidget {
   const createdSucces({super.key});

  @override
  State<createdSucces> createState() => _createdSuccesState();
}

class _createdSuccesState extends State<createdSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.network(
              "https://lottie.host/be1834ec-b744-4bf3-b718-34aee9ce9eaa/D5lxZJryLZ.json",
              width:250.w,
              height: 250.h,
            ),
            Center(
              child: CustomText(
                text: "Account Created",
                size: 24.sp,
                color: myColor.textcolor,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Center(
                child: CustomText(
                  text: "Your account has been\ncreated succesfully",
                  size: 22.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  letterSpacing: 2,
                  textStyle: const TextStyle(),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bottomnav");
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(
                            200.w,
                            45.h)),
                        textStyle: WidgetStatePropertyAll(
                            GoogleFonts.poppins(fontSize: 18.r)),
                      ),
                      child: CustomText(
                        text: "Done",
                        size: 20.sp,
                        color: myColor.background,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
