// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_allItem extends StatefulWidget {
  const user_allItem({super.key});

  @override
  State<user_allItem> createState() => _user_allItemState();
}

class _user_allItemState extends State<user_allItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.fieldbackground,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Center(
                          child: CustomText(text: "Offers", size: 30.spMin)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 320.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.fieldbackground,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Center(
                          child: CustomText(text: "Offers", size: 30.spMin)),
                    ),
                  ),
                ]),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 200.h,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/user_fooddetails");
                      },
                      child: customCard(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: SizedBox(
                                  width: 150.w,
                                  height: 120.h,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    child: Image.asset(
                                      "assets/images/image.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 7.w,
                                top: 3.h
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Name',
                                    size: 18.spMin,
                                    weight: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          IconlyLight.heart,
                                          size: 22,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.w,top: 3.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'quantity',
                                    size: 14.spMin,
                                    textStyle: const TextStyle(),
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 7.w,
                                bottom: 3.h
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "₹25",
                                    size: 18.spMin,
                                    textStyle: const TextStyle(),
                                    weight: FontWeight.w600,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: InkWell(
                                        onTap: () {},
                                        child: Icon(IconlyLight.bag,size: 22,)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
