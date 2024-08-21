// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          size: 21,
          color: myColor.textcolor,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
          textStyle: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: CustomText(
                text: "Enter your otp here,\nand conform",
                size: 20,
                color: myColor.textcolor,
                weight: FontWeight.w500,
                textAlign: TextAlign.center,
                textStyle: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Pinput(
              showCursor: true,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(15),
                    height: ScreenUtil().setHeight(1),
                    color: myColor.textcolor,
                    margin: EdgeInsets.only(bottom: 12),
                  ),
                ],
              ),
              defaultPinTheme: PinTheme(
                  margin: EdgeInsets.only(left: 10),
                  width: ScreenUtil().setWidth(50),
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      color: myColor.fieldbackground,
                      borderRadius: BorderRadius.circular(10))),
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
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/confirmpass");
                    },
                    child: CustomText(
                        text: "Verify",
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
                          ScreenUtil().setWidth(150),
                          ScreenUtil().setHeight(45))),
                      textStyle: WidgetStatePropertyAll(
                          GoogleFonts.poppins(fontSize: 18)),
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
