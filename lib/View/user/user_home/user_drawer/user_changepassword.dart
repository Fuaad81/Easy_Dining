import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class user_Change_Password extends StatefulWidget {
  const user_Change_Password({super.key});

  @override
  State<user_Change_Password> createState() => _user_Change_PasswordState();
}

class _user_Change_PasswordState extends State<user_Change_Password> {
  final passcontroller = TextEditingController();
  final newpasscontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  bool passview = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Change Password", size: 21.spMin),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.network(
                    "https://lottie.host/f4097e3e-c92e-482b-addc-7a7a3632ece0/E2OLlJTcoE.json",
                    width: 300.w,
                    height: 220.h,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CustomText(
                  text: "Current Password",
                  size: 20.spMin,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SizedBox(
                  width: 340.w,
                  child: CustomTextFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: myColor.textcolor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: myColor.textcolor)),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    controller: passcontroller,
                    obscureText: passview,

                    hintText: "current password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passview = !passview;
                          });
                        }, icon: passview == true ? const Icon(IconlyLight.hide) : const Icon(IconlyLight.show)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: "forgot password?",
                      size: 18.spMin,
                      color: myColor.errortext,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: CustomText(
                  text: "New Password",
                  size: 20.spMin,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SizedBox(
                  width: 340.w,
                  child: CustomTextFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: myColor.textcolor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: myColor.textcolor)),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    hintText: "New password",
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(IconlyLight.show)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CustomText(
                  text: "confirm Password",
                  size: 20.spMin,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SizedBox(
                  width: 340.w,
                  child: CustomTextFormField(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: myColor.textcolor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: myColor.textcolor)),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    hintText: "confirm password",
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(IconlyLight.show)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      backgroundColor: WidgetStateProperty.all(myColor.maincolor),
                      foregroundColor:
                          WidgetStateProperty.all(myColor.background),
                      minimumSize: WidgetStateProperty.all(Size(340.w, 45.h)),
                    ),
                    child: CustomText(
                      text: "Update",
                      size: 20.spMin,
                      color: myColor.background,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
