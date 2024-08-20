import 'package:easy_dine_in/model/style/color.dart';
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
        title: Text(
          "Confirm OTP",
          style: GoogleFonts.poppins(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: myColor.textcolor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "Enter your otp here,\nand conform",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w400),
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
                    child: Text("Verify"),
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
