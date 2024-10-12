import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_Db_Acpt_Details extends StatefulWidget {
  const admin_Db_Acpt_Details({super.key});

  @override
  State<admin_Db_Acpt_Details> createState() => _admin_Db_Acpt_DetailsState();
}

class _admin_Db_Acpt_DetailsState extends State<admin_Db_Acpt_Details> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Delivery Boy",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 320.w,
                    decoration: BoxDecoration(
                        color: myColor.tabcolor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Name",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: "Name",
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Email",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: "sample@gmail.com",
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Phone No",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: "1234567890",
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "License",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: "sample.jpg",
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            color: myColor.maincolor,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: Center(
                                            child: CustomText(
                                          text: "open",
                                          size: 14.spMin,
                                          color: myColor.background,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w, bottom: 40.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Location",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: "Location",
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
