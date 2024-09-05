import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_Profile extends StatefulWidget {
  const user_Profile({super.key});

  @override
  State<user_Profile> createState() => _user_ProfileState();
}

class _user_ProfileState extends State<user_Profile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    return Scaffold(
      backgroundColor: myColor.background,
        appBar: AppBar(
          backgroundColor: myColor.background,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CustomText(
            text: "Profile",
            size: 21,
            color: myColor.textcolor,
            letterSpacing: 1,
            weight: FontWeight.w500,
            textStyle: const TextStyle(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/user_editprofile");
                },
                icon: Icon(
                  IconlyLight.edit_square,
                  size: 25.w,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: myColor.tabcolor,
                    radius: 50.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: nameController,
                      prefixIcon: Icon(
                        IconlyLight.profile,
                        size: 20.w,
                      ),
                      hintText: "Name",
                      hintStyle: const TextStyle(fontSize: 18)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: emailController,
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 20.w,
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(fontSize: 18)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: numberController,
                      prefixIcon: Icon(
                        IconlyLight.call,
                        size: 20.w,
                      ),
                      hintText: "Number",
                      hintStyle: const TextStyle(fontSize: 18)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: addressController,
                      prefixIcon: Icon(
                        IconlyLight.location,
                        size: 20.w,
                      ),
                      hintText: "Address",
                      hintStyle: const TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ));
  }
}
