import 'dart:ui';

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class dboy_Account_Created extends StatefulWidget {
  const dboy_Account_Created({super.key});

  @override
  State<dboy_Account_Created> createState() => _dboy_Account_CreatedState();
}

class _dboy_Account_CreatedState extends State<dboy_Account_Created> {
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
          Column(
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
                size: 24.spMin,
                color: myColor.background,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Center(
                child: CustomText(
                  text: "Your account has been\ncreated succesfully",
                  size: 22.spMin,
                  color: myColor.background,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  letterSpacing: 1,
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
                        Navigator.pushNamed(context, "/db_bottombar");
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
                        
                      ),
                      child: CustomText(
                        text: "Done",
                        size: 20.spMin,
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
        ],
      ),
    );
  }
}