import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_User_Details extends StatefulWidget {
  const admin_User_Details({super.key});

  @override
  State<admin_User_Details> createState() => _admin_User_DetailsState();
}

class _admin_User_DetailsState extends State<admin_User_Details> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "user details",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                
                radius: 45,
                backgroundImage: NetworkImage(data["imageUrl"],)
              ),
            ),
            Padding(
               padding: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Name", size: 20.sp),
                  SizedBox(
                    width: 200.w,
                    child: CustomTextFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      initialValue: data["name"],
                      readOnly: true,
                    ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Email", size: 20.sp),
                  SizedBox(
                    width: 200.w,
                    child: CustomTextFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      initialValue: data["email"],
                      readOnly: true,
                    ),
                    ),
                ],
              ),
            ),
            Padding(
               padding: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Location", size: 20.sp),
                  SizedBox(
                    width: 200.w,
                    child: CustomTextFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      initialValue: data["address"],
                      readOnly: true,
                    ),
                    ),
                ],
              ),
            ),
            Padding(
               padding: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Number", size: 20.sp),
                  SizedBox(
                    width: 200.w,
                    child: CustomTextFormField(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      initialValue: data["number"],
                      readOnly: true,
                    ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
