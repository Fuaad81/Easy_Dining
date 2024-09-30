// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class user_Otp extends StatefulWidget {
   const user_Otp({super.key});

  @override
  State<user_Otp> createState() => _user_OtpState();
}

class _user_OtpState extends State<user_Otp> {
  final _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: CustomText(
          text: "Confirm OTP",
          size: 21.spMin,
          
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
                size: 20.spMin,
                
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
                  textStyle:  GoogleFonts.poppins(
                        color: myColor.textcolor
                      ),
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
                      Navigator.pushNamed(context, "/user_confirmpass");
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
      )),
    );
  }
}
