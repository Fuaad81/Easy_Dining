import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Edit Profile",
          size: 20.sp,
          textStyle: const TextStyle(),
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Center(
              child: CircleAvatar(
                  backgroundColor: myColor.fieldbackground,
                  radius: 50.w,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomRight,

                      child: IconButton(
                          onPressed: () {}, icon: Icon(IconlyLight.image_2)),
                    ),
                  ])),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: CustomTextFormField(
                contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  controller: nameController,
                  prefixIcon: Icon(
                    IconlyLight.profile,
                    size: 20.w,
                  ),
                  labelText: CustomText(
                    text: "Name",
                    size: 18.sp,
                  ),
                  labelStyle: TextStyle()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: CustomTextFormField(
                contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  controller: emailController,
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    size: 20.w,
                  ),
                  labelText: CustomText(
                    text: "Email",
                    size: 18.sp,
                  ),
                  labelStyle: TextStyle()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: CustomTextFormField(
                contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  controller: numberController,
                  prefixIcon: Icon(
                    IconlyLight.call,
                    size: 20.w,
                  ),
                  labelText: CustomText(
                    text: "Number",
                    size: 18.sp,
                  ),
                  labelStyle: TextStyle()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: CustomTextFormField(
                contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  controller: addressController,
                  prefixIcon: Icon(
                    IconlyLight.location,
                    size: 20.w,
                  ),
                  labelText: CustomText(
                    text: "Address",
                    size: 18.sp,
                  ),
                  labelStyle: TextStyle()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.tabcolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(
                            120.w,
                            40.h)),
                        textStyle: WidgetStatePropertyAll(
                            GoogleFonts.poppins(fontSize: 18.sp)),
                      ),
                      child: CustomText(
                          text: "cancel",
                          size: 18.sp,
                          color: myColor.textcolor,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          textStyle:  const TextStyle(),
                        )),
                ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(
                            120.w,
                            40.h)),
                        textStyle: WidgetStatePropertyAll(
                            GoogleFonts.poppins(fontSize: 18.sp)),
                      ),
                      child: CustomText(
                          text: "save",
                          size: 18.sp,
                          color: myColor.background,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          textStyle:  const TextStyle(),
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
