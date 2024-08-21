// ignore_for_file: prefer_const_constructors

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
              width: ScreenUtil().setWidth(250),
              height: ScreenUtil().setHeight(250),
            ),
            Center(
              child: CustomText(
                text: "Account Created",
                size: 24,
                color: myColor.textcolor,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
                textStyle: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: CustomText(
                  text: "Your account has been\ncreated succesfully",
                  size: 22,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  letterSpacing: 2,
                  textStyle: TextStyle(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bottomnav");
                      },
                      child: CustomText(
                        text: "Done",
                        size: 20,
                        color: myColor.background,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
