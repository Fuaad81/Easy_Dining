// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
   const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Confirm OTP",
          size: 21.sp,
          color: myColor.textcolor,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Center(
              child: CustomText(
                text: "Enter your otp here,\nand conform",
                size: 20.sp,
                color: myColor.textcolor,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Pinput(
              showCursor: true,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 15.w,
                    height: 1.h,
                    color: myColor.textcolor,
                    margin: EdgeInsets.only(bottom: 12.h),
                  ),
                ],
              ),
              defaultPinTheme: PinTheme(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: myColor.fieldbackground,
                      borderRadius: BorderRadius.circular(10.r))),
              controller: _otp,
              errorPinTheme: PinTheme(
                  decoration: BoxDecoration(
                      border: Border.all(color: myColor.errortext))),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null) {
                  return "enter valid number";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/confirmpass");
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                      backgroundColor:
                          WidgetStatePropertyAll(myColor.maincolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStatePropertyAll(Size(
                          150.w,
                          45.h)),
                    ),
                    child: CustomText(
                        text: "Verify",
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
      )),
    );
  }
}
