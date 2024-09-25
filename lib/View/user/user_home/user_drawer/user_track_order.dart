import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_Track_Order extends StatefulWidget {
  const user_Track_Order({super.key});

  @override
  State<user_Track_Order> createState() => _user_Track_OrderState();
}

class _user_Track_OrderState extends State<user_Track_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Track Order",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: myColor.maincolor,
                        )),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: CustomText(
                                  text: "Your Order", size: 20.spMin),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 5.h),
                              child: CustomText(text: "Date", size: 20.spMin),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: CustomText(
                                text: "Phone",
                                size: 20.spMin,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: CustomText(text: ":", size: 20.spMin),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: CustomText(text: ":", size: 20.spMin),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: CustomText(
                                text: ":",
                                size: 20.spMin,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: CustomText(
                                text: "462438",
                                size: 20.spMin,
                                color: myColor.maincolor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 5.h),
                              child: CustomText(
                                text: "July 20 , 1:30pm",
                                size: 20.spMin,
                                color: myColor.maincolor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: CustomText(
                                text: "1234567890",
                                size: 20.spMin,
                                color: myColor.maincolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            bottom: 10.h,
            left: 25.w,
            right: 25.w,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(myColor.maincolor),
                    foregroundColor: WidgetStatePropertyAll(myColor.background),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                    minimumSize: WidgetStatePropertyAll(Size(300.w, 50.h))),
                onPressed: () {
                  
                },
                child: CustomText(text: "Done", size: 20.spMin)),
          )
        ],
      ),
    );
  }
}
