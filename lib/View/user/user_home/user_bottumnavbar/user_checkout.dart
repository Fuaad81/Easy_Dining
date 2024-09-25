import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_Check_Out extends StatefulWidget {
  const user_Check_Out({super.key});

  @override
  State<user_Check_Out> createState() => _user_Check_OutState();
}

class _user_Check_OutState extends State<user_Check_Out> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Check Out", size: 21.spMin),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: myColor.background,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  offset: const Offset(0, 4),
                                  color: myColor.tabcolor)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w, right: 10.w, top: 20.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Total",
                                    size: 20.spMin,
                                    weight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: "₹35.38",
                                    size: 20.spMin,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 50.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 30.w,
                                right: 10.w,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: "Name",
                                      size: 20.spMin,
                                      weight: FontWeight.w500),
                                  CustomText(
                                      text: "2 x ₹11.07",
                                      size: 20.spMin,
                                      weight: FontWeight.w300),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.w, right: 10.w, top: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: "Name",
                                      size: 20.spMin,
                                      weight: FontWeight.w500),
                                  CustomText(
                                      text: "1 x ₹11.40",
                                      size: 20.spMin,
                                      weight: FontWeight.w300),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.w, right: 10.w, top: 5.h, bottom: 20.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: "Delivery Charge",
                                      size: 20.spMin,
                                      weight: FontWeight.w500),
                                  CustomText(
                                      text: "₹1.84",
                                      size: 20.spMin,
                                      weight: FontWeight.w300),
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
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/user_location");
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: myColor.background,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 5,
                                color: myColor.tabcolor
                              )
                            ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Shipping Details",
                                      size: 20.spMin,
                                      weight: FontWeight.w500,
                                    ),
                                    CustomText(
                                      text: "Tirur Kuttayi road ashanpadi",
                                      size: 18.spMin,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const Icon(IconlyLight.arrow_right_2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/user_paymethod");
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: myColor.background,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 5,
                                color: myColor.tabcolor
                              )
                            ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Payment Details",
                                      size: 20.spMin,
                                      weight: FontWeight.w500,
                                    ),
                                    CustomText(
                                      text: "select pay method",
                                      size: 18.spMin,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const Icon(IconlyLight.arrow_right_2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                  Navigator.pop(context);
                },
                child: CustomText(text: "Confirm Order", size: 20.spMin)),
          )
        ],
      ),
    );
  }
}
