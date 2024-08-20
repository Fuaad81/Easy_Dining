import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final _newpass = TextEditingController();
  final _newconfirmpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
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
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "Enter new password and\nconform",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _newpass,
                  labelText: Text("new password"),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(IconlyLight.lock),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: ScreenUtil().setWidth(315),
                height: ScreenUtil().setHeight(44),
                child: CustomTextFormField(
                  controller: _newconfirmpass,
                  labelText: Text("confirm password"),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: myColor.textcolor),
                  prefixIcon: Icon(IconlyLight.lock),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("change password"),
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
