import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_Cart extends StatefulWidget {
  const user_Cart({super.key});

  @override
  State<user_Cart> createState() => _user_CartState();
}

class _user_CartState extends State<user_Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
        appBar: AppBar(
          backgroundColor: myColor.background,
          title: const CustomText(
            text: "Cart",
            size: 21,
            weight: FontWeight.w600,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Image.asset(
                "assets/icons/ic_notification.png",
                width: 25.w,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customCard(
                              color: myColor.background,
                                elevation: 6,
                                child: SizedBox(
                                  width: 320.w,
                                height: 100.h,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            bottomLeft: Radius.circular(10.r)),
                                        child: Image.asset(
                                          "assets/images/image.png",
                                          width: 120.w,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Positioned(
                                          left: 140,
                                          child: CustomText(
                                            text: "Name",
                                            size: 20,
                                            weight: FontWeight.w500,
                                          )),
                                      Positioned(
                                          top: 25.h,
                                          left: 140,
                                          child: const CustomText(
                                            text: "catagory",
                                            size: 20,
                                            weight: FontWeight.w400,
                                          )),
                                      Positioned(
                                        right: -5.w,
                                        top: -5.h,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              IconlyLight.close_square,
                                              color: myColor.tabcolor,
                                            )),
                                      ),
                                      Positioned(
                                        left: 130,
                                        top: 50.h,
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CupertinoIcons
                                                      .minus_square_fill,
                                                  color: myColor.maincolor,
                                                )),
                                            CustomText(text: "1", size: 18.w),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  IconlyBold.plus,
                                                  color: myColor.maincolor,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          top: 60.h,
                                          right: 20.w,
                                          child: const CustomText(
                                            text: "\$15",
                                            size: 20,
                                            weight: FontWeight.w700,
                                          ))
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Container(
                width: 340.w,
                height: 150.h,
                decoration: BoxDecoration(
                    color: myColor.tabcolor.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: const CustomText(
                                text: "Subtotal",
                                size: 20,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: const CustomText(
                                text: "\$30",
                                size: 20,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: const CustomText(
                                text: "Delivery",
                                size: 20,
                                weight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: const CustomText(
                                text: "\$1.84",
                                size: 20,
                                weight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: const CustomText(
                                text: "Total",
                                size: 20,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: const CustomText(
                                text: "\$31.84",
                                size: 20,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/user_bottomnav");
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                backgroundColor: WidgetStateProperty.all(myColor.maincolor),
                foregroundColor:
                    WidgetStateProperty.all(myColor.background),
                minimumSize: WidgetStateProperty.all(Size(340.w, 45.h)),
              ),
              child: CustomText(
                text: "Check Out",
                size: 20,
                color: myColor.background,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              )),
        )
          ],
        ));
  }
}
