import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_order_list extends StatefulWidget {
  const user_order_list({super.key});

  @override
  State<user_order_list> createState() => _user_order_listState();
}

class _user_order_listState extends State<user_order_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Order List", size: 21.spMin,weight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return SizedBox(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
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
                              color: myColor.tabcolor
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: "July 20,2023", size: 20.spMin,weight: FontWeight.w600,),
                                  CustomText(text: "₹35.38", size: 20.spMin,weight: FontWeight.w600,),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w,right: 5.w,top: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: "Order Id : 462438", size: 20.spMin,weight: FontWeight.w300),
                                  Container(
                                    width: 70.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: myColor.maincolor,
                                      borderRadius: BorderRadius.circular(10.r)
                                    ),
                                    child: Center(
                                      child: CustomText(text: "shipping", size: 15.spMin,color: myColor.background,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 50.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w,right: 10.w,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: "Name", size: 20.spMin,weight: FontWeight.w300),
                                  CustomText(text: "2 x ₹11.07", size: 20.spMin,weight: FontWeight.w300),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w,right: 10.w,top: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: "Name", size: 20.spMin,weight: FontWeight.w300),
                                  CustomText(text: "1 x ₹11.40", size: 20.spMin,weight: FontWeight.w300),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.w,right: 10.w,top: 5.h,bottom: 20.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: "Delivery Charge", size: 20.spMin,weight: FontWeight.w300),
                                  CustomText(text: "₹1.84", size: 20.spMin,weight: FontWeight.w300),
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
                padding: EdgeInsets.only(top: 10.h,right: 15.w,left: 15.w),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(myColor.maincolor),
                          foregroundColor: WidgetStatePropertyAll(myColor.background),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)
                          )),
                          minimumSize: WidgetStatePropertyAll(Size(0.w, 50.h))
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, "/user_trackorder");
                        }, child: const CustomText(text: "Track Order", size: 20)),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}