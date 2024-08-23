// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customcard.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class allItem extends StatefulWidget {
  const allItem({super.key});

  @override
  State<allItem> createState() => _allItemState();
}

class _allItemState extends State<allItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.fieldbackground,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Center(child: CustomText(text: "Offers", size: 30.sp)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.fieldbackground,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                              child: Center(child: CustomText(text: "Offers", size: 30.sp)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 170.h,
                        width: 160.w,
                        child: customCard(
                          elevation: 5,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r) )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160.w,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r)),
                                  child: Image.asset(
                                    "assets/images/image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Name',
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            IconlyLight.heart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'quantity',
                                      size: 14.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w400,
                                    ),
                                    
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "25-",
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            CupertinoIcons.cart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 170.h,
                        width: 160.w,
                        child: customCard(
                          elevation: 5,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r) )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160.w,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r)),
                                  child: Image.asset(
                                    "assets/images/image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Name',
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            IconlyLight.heart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'quantity',
                                      size: 14.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w400,
                                    ),
                                    
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "25-",
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            CupertinoIcons.cart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 170.h,
                        width: 160.w,
                        child: customCard(
                          elevation: 5,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r) )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160.w,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r)),
                                  child: Image.asset(
                                    "assets/images/image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Name',
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            IconlyLight.heart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'quantity',
                                      size: 14.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w400,
                                    ),
                                    
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "25-/",
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            CupertinoIcons.cart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 170.h,
                        width: 160.w,
                        child: customCard(
                          elevation: 5,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r) )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 160.w,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r)),
                                  child: Image.asset(
                                    "assets/images/image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Name',
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            IconlyLight.heart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'quantity',
                                      size: 14.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w400,
                                    ),
                                    
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.w,top: 2.h),
                                child: Row(
                                  
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "25-/",
                                      size: 16.sp,
                                      textStyle: TextStyle(),
                                      weight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 2.w),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            CupertinoIcons.cart,
                                            size: 20.w,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
