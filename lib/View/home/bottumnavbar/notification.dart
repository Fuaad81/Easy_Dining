import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: "Notification", size: 21.sp,weight: FontWeight.w500,),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h,left: 15.w,right: 15.w),
          child: Container(
              width: 300.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: myColor.tabcolor,
                borderRadius: BorderRadius.all(Radius.circular(10.r))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w,top: 10.h),
                    child: CustomText(text: "⏳Limited-Time Deal", size: 18.sp,weight: FontWeight.w500,textStyle            : const TextStyle(),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w,top: 10.h,),
                    child: CustomText(text: "hurry! enjoy 20% off salad items in \nthis weakend ", size: 16.sp,textStyle: const TextStyle(),),
                  )
                ],
              ),
            ),
        );
      },),
    );
  }
}