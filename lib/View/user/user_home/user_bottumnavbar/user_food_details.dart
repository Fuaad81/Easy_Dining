import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_Food_Details extends StatefulWidget {
  const user_Food_Details({super.key});

  @override
  State<user_Food_Details> createState() => _user_Food_DetailsState();
}

class _user_Food_DetailsState extends State<user_Food_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Fodd Details",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 340.w,
              child: customCard(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r)),
                        child: Image.asset(
                          "assets/images/image.png",
                          height: 350.h,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Food Name",
                            size: 20.spMin,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                              onTap: () {},
                              child: const Icon(
                                IconlyLight.heart,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 12.w, top: 5.h, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            glow: false,
                            itemCount: 5,
                            initialRating: 0,
                            allowHalfRating: true,
                            itemSize: 18,
                            unratedColor: myColor.tabcolor,
                            itemBuilder: (context, index) {
                              return Icon(
                                IconlyBold.star,
                                color: myColor.maincolor,
                                fill: 1.0,
                              );
                            },
                            onRatingUpdate: (value) {},
                          ),
                          CustomText(
                            text: "10g - 20g",
                            size: 17.spMin,
                            weight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                      child: CustomText(
                        text:
                            "Lorem ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text.",
                        size: 18.spMin,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, bottom: 15.h, top: 5.h),
                      child: CustomText(
                        text: "₹150",
                        size: 20.spMin,
                        weight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                      backgroundColor:
                          WidgetStatePropertyAll(myColor.maincolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStatePropertyAll(Size(150.w, 40.h)),
                    ),
                    child: CustomText(
                      text: "Buy Now",
                      size: 18.spMin,
                      weight: FontWeight.w500,
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r))),
                      backgroundColor: WidgetStatePropertyAll(myColor.tabcolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStatePropertyAll(Size(150.w, 40.h)),
                    ),
                    child: CustomText(
                      text: "Add Cart",
                      size: 18.spMin,
                      weight: FontWeight.w500,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
