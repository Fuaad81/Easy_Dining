import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_Booking extends StatefulWidget {
  const user_Booking({super.key});

  @override
  State<user_Booking> createState() => _user_BookingState();
}

class _user_BookingState extends State<user_Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Booking",
          size: 21,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/ic_notification.png",
                width: 30,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index) {
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/user_tabledetails");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customCard(
                    shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r))),
                      child: SizedBox(
                    width: 160.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 160.w,
                            height: 120.h,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r)),
                                child: Image.asset(
                                  "assets/images/table_image.jpg",
                                  fit: BoxFit.cover,
                                ))),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h,bottom: 10.h,left: 10.w),
                                  child: const CustomText(text: "Table No : ", size: 18,weight: FontWeight.w500,),
                                )
                      ],
                    ),
                  )),
                  customCard(
                      child: SizedBox(
                    width: 160.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 160.w,
                            height: 120.h,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r)),
                                child: Image.asset(
                                  "assets/images/table_image.jpg",
                                  fit: BoxFit.cover,
                                ))),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h,bottom: 10.h,left: 10.w),
                                  child: const CustomText(text: "Table No : ", size: 18,weight: FontWeight.w500,),
                                )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
