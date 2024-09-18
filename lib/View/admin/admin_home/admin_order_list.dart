import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_Order_List extends StatefulWidget {
  const admin_Order_List({super.key});

  @override
  State<admin_Order_List> createState() => _admin_Order_ListState();
}

class _admin_Order_ListState extends State<admin_Order_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: myColor.notification,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: myColor.tabcolor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h,left: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Name", size: 20.spMin,weight: FontWeight.w500,),
                            CustomText(text: "sample@gmail.com", size: 16.spMin,weight: FontWeight.w500,),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: CustomText(text: "Food Name", size: 20.spMin,weight: FontWeight.w500,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: CustomText(text: "Quantity", size: 20.spMin,weight: FontWeight.w500,),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h,bottom: 5.h),
                              child: CustomText(text: "Prize", size: 20.spMin,weight: FontWeight.w500,),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h,right: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(text: "Location", size: 20.spMin),
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: Container(
                                width: 80.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  color: myColor.background,
                                  borderRadius: BorderRadius.circular(10.r)
                                ),
                                child: Center(
                                  child: CustomText(text: "Item Image", size: 14.spMin,textAlign: TextAlign.center,),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}