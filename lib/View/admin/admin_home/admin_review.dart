import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class admin_Review extends StatefulWidget {
  const admin_Review({super.key});

  @override
  State<admin_Review> createState() => _admin_ReviewState();
}

class _admin_ReviewState extends State<admin_Review> {
  final TextEditingController reviewcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: const CustomText(
          text: "Review",
          size: 21,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: 
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
            return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                  child: Container(
                    width: 320.w,
                    decoration: BoxDecoration(
                        color: myColor.background,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 4),
                              color: myColor.tabcolor,
                              blurRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const CustomText(
                                          text: "Name",
                                          size: 18,
                                          weight: FontWeight.w400,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: const CustomText(
                                            text: "14-2-24",
                                            size: 10,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: RatingBar.builder(
                                        glow: false,
                                        itemCount: 5,
                                        initialRating: 0,
                                        allowHalfRating: true,
                                        unratedColor: myColor.tabcolor,
                                        itemSize: 20,
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            IconlyBold.star,
                                            color: myColor.maincolor,
                                            fill: 1.0,
                                          );
                                        },
                                        onRatingUpdate: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: const Row(
                            children: [
                              Expanded(
                                  child: CustomText(
                                      text:
                                          "Lorem ipsum is simply dummy text of the printing and typesetting industry.",
                                      size: 14))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 10.h,bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 300.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: myColor.fieldbackground,
                                    hintText: "replay",
                                    hintStyle: GoogleFonts.poppins(
                                        color: myColor.linktext, fontSize: 14),
                                    controller: reviewcontroller),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
          },),
          
    );
  }
}
