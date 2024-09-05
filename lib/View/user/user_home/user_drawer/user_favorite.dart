import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_Favorite extends StatefulWidget {
  const user_Favorite({super.key});

  @override
  State<user_Favorite> createState() => _user_FavoriteState();
}

class _user_FavoriteState extends State<user_Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: const CustomText(text: "Favorite", size: 21),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customCard(
              elevation: 5,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: SizedBox(
                width: 160.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.w,
                      height: 100.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r)),
                        child: Image.asset(
                          "assets/images/image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 4.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Name',
                            size: 16,
                            textStyle: TextStyle(),
                            weight: FontWeight.w600,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  IconlyBold.heart,
                                  size: 20.w,
                                  color: myColor.maincolor,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 2.h),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'quantity',
                            size: 14,
                            textStyle: TextStyle(),
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: "\$25",
                            size: 16,
                            textStyle: TextStyle(),
                            weight: FontWeight.w600,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: InkWell(
                                onTap: () {},
                                child: Image.asset("assets/icons/ic_cart_outline.png",width: 20.w,color: myColor.textcolor,)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            customCard(
              elevation: 5,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: SizedBox(
                width: 160.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.w,
                      height: 100.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r)),
                        child: Image.asset(
                          "assets/images/image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 4.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Name',
                            size: 16,
                            textStyle: TextStyle(),
                            weight: FontWeight.w600,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  IconlyBold.heart,
                                  size: 20.w,
                                  color: myColor.maincolor,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 2.h),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'quantity',
                            size: 14,
                            textStyle: TextStyle(),
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: "\$25",
                            size: 16,
                            textStyle: TextStyle(),
                            weight: FontWeight.w600,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: InkWell(
                                onTap: () {},
                                child: Image.asset("assets/icons/ic_cart_outline.png",width: 20.w,color: myColor.textcolor,)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
