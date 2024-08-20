import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final _forgotpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                "Please enter your email correctly\nand reset your password",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: ScreenUtil().setWidth(315),
              height: ScreenUtil().setHeight(44),
              child: CustomTextFormField(
                controller: _forgotpass,
                labelText: Text("enter your email"),
                labelStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: myColor.textcolor),
                prefixIcon: Icon(CupertinoIcons.mail),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/otp");
                    },
                    child: Text("Send OTP"),
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
