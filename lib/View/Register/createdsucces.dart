import 'package:easy_dine_in/model/style/color.dart';
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
              child: Text(
                "Account Created",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Your account has been\ncreated succesfully",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 22, fontWeight: FontWeight.w400,letterSpacing: 2),
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
                      child: Text("Done"),
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
