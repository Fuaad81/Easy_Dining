import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "FeedBack", size: 21.sp,weight: FontWeight.w500,textStyle: const TextStyle(),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w,top: 25.h),
            child: CustomText(text: "How do you rate this app?", size: 20.sp),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w,top: 20.h),
            child: RatingBar.builder(
              itemCount: 5,
              initialRating: 0,
              allowHalfRating: true,
              unratedColor: myColor.tabcolor,
              itemPadding: EdgeInsets.symmetric(horizontal: 7.w),
              itemBuilder: (context, index) {
              return Icon(IconlyBold.star,color: myColor.maincolor,fill: 1.0,);

            }, onRatingUpdate: (value) {
              
            },),
          ),
          
        ],
      ),
    );
  }
}