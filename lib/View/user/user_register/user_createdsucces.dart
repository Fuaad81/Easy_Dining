// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class user_createdSucces extends StatefulWidget {
   const user_createdSucces({super.key});

  @override
  State<user_createdSucces> createState() => _user_createdSuccesState();
}

class _user_createdSuccesState extends State<user_createdSucces> {
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
                size: 24,
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
                  size: 22,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  letterSpacing: 1,
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
                        Navigator.pushNamed(context, "/user_bottomnav");
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
                        size: 20,
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
