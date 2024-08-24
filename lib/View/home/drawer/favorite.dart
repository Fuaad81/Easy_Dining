import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customcard.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Favorite", size: 21.sp),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 170.h,
                width: 160.w,
                child: customCard(
                  elevation: 5,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                          )),
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
                            CustomText(
                              text: 'Name',
                              size: 16.sp,
                              textStyle: const TextStyle(),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'quantity',
                              size: 14.sp,
                              textStyle: const TextStyle(),
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
                            CustomText(
                              text: "\$25",
                              size: 16.sp,
                              textStyle: const TextStyle(),
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
                )),
            SizedBox(
                height: 170.h,
                width: 160.w,
                child: customCard(
                  elevation: 5,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r))),
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
                            CustomText(
                              text: 'Name',
                              size: 16.sp,
                              textStyle: const TextStyle(),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'quantity',
                              size: 14.sp,
                              textStyle: const TextStyle(),
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
                            CustomText(
                              text: "\$25",
                              size: 16.sp,
                              textStyle: const TextStyle(),
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
                )),
          ],
        ),
      ]),
    );
  }
}
