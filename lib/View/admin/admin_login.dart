import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_Login extends StatefulWidget {
  const admin_Login({super.key});

  @override
  State<admin_Login> createState() => _admin_LoginState();
}

class _admin_LoginState extends State<admin_Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 300.w,
                  height: 280.h,
                  decoration: BoxDecoration(
                      color: myColor.tabcolor,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.asset(
                        "assets/images/app_logo.png",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 450.h,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(200.r)),
                  boxShadow: [
                    BoxShadow(
                      color: myColor.textcolor.withOpacity(0.4),
                      offset: const Offset(0, -4),
                      blurRadius: 4,
                    )
                  ],
                  color: myColor.background,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: const CustomText(
                          text: "Welcome Back!",
                          size: 27,
                          weight: FontWeight.bold,
                          textStyle: TextStyle(),
                          letterSpacing: 1.4,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: const CustomText(
                          text: "Login to Continue...",
                          size: 20,
                          weight: FontWeight.w400,
                          textStyle: TextStyle(),
                          letterSpacing: 1.4,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: SizedBox(
                          width: 300.w,
                          child: CustomTextFormField(
                            controller: _emailcontroller,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            labelText: const CustomText(
                                text: "email",
                                size: 18,
                                weight: FontWeight.w500),
                            prefixIcon: const Icon(
                              IconlyLight.message,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: SizedBox(
                          width: 300.w,
                          child: CustomTextFormField(
                            controller: _passwordcontroller,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            labelText: const CustomText(
                                text: "password",
                                size: 18,
                                weight: FontWeight.w500),
                            prefixIcon: const Icon(
                              IconlyLight.lock,
                              size: 25,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.hide)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.r))),
                                    backgroundColor: WidgetStatePropertyAll(
                                        myColor.maincolor),
                                    foregroundColor: WidgetStatePropertyAll(
                                        myColor.background),
                                    minimumSize: WidgetStatePropertyAll(
                                        Size(200.w, 50.h))),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, "/admin_bottombar");
                                  print("button clicked");
                                },
                                child: const CustomText(
                                  text: "Login",
                                  size: 25,
                                  weight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
