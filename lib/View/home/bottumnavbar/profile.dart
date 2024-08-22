import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CustomText(
            text: "Profile",
            size: 20.sp,
            color: myColor.textcolor,
            letterSpacing: 2,
            weight: FontWeight.w500,
            textStyle: const TextStyle(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/editprofile");
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
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    readOnly: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      controller: nameController,
                      prefixIcon: Icon(
                        IconlyLight.profile,
                        size: 20.w,
                      ),
                      hintText:"Name",
                      hintStyle: TextStyle(
                        fontSize: 18.sp
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    readOnly: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      controller: emailController,
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 20.w,
                      ),
                      hintText:"Email",
                      hintStyle: TextStyle(
                        fontSize: 18.sp
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    readOnly: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      controller: numberController,
                      prefixIcon: Icon(
                        IconlyLight.call,
                        size: 20.w,
                      ),
                      hintText:"Number",
                      hintStyle: TextStyle(
                        fontSize: 18.sp
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    readOnly: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      controller: addressController,
                      prefixIcon: Icon(
                        IconlyLight.location,
                        size: 20.w,
                      ),
                      hintText:"Address",
                      hintStyle: TextStyle(
                        fontSize: 18.sp
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
