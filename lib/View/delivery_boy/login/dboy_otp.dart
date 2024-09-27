import 'dart:ui';

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';

class dboy_Otp extends StatefulWidget {
  const dboy_Otp({super.key});

  @override
  State<dboy_Otp> createState() => _dboy_OtpState();
}

class _dboy_OtpState extends State<dboy_Otp> {
  final _otp = TextEditingController();
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
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: ListTile(
                    leading: InkWell(
                        onTap: () {},
                        child: Icon(
                          IconlyLight.arrow_left_2,
                          color: myColor.background,
                          size: 30,
                        )),
                    title: CustomText(
                      text: "Enter Otp",
                      size: 21.spMin,
                      color: myColor.background,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: CustomText(
                      text: "Enter your otp here,\nand conform",
                      size: 20.spMin,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: myColor.background,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
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
                  padding: EdgeInsets.only(top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/db_confirmpassword");
                          },
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                            backgroundColor:
                                WidgetStatePropertyAll(myColor.maincolor),
                            foregroundColor:
                                WidgetStatePropertyAll(myColor.background),
                            minimumSize:
                                WidgetStatePropertyAll(Size(150.w, 45.h)),
                          ),
                          child: CustomText(
                            text: "Verify",
                            size: 20.spMin,
                            color: myColor.background,
                            weight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
