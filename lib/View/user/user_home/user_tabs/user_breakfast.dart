// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_breakFast extends StatefulWidget {
  const user_breakFast({super.key});

  @override
  State<user_breakFast> createState() => _user_breakFastState();
}

class _user_breakFastState extends State<user_breakFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 200.h,
            
            ),
            shrinkWrap: true,
            
        itemCount: 6,
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: customCard(
              elevation: 5,
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
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          child: Image.asset(
                            "assets/images/image.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w,),
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
                    padding: EdgeInsets.only(left: 7.w),
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
                    padding: EdgeInsets.only(left: 7.w,),
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
                                        child: const Icon(IconlyLight.bag,size: 22,)),
                                  )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
