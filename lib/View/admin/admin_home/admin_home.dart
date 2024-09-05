import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class admin_home extends StatefulWidget {
  const admin_home({super.key});

  @override
  State<admin_home> createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: myColor.background,
          leading: const Icon(
            IconlyLight.location,
            size: 30,
          ),
          automaticallyImplyLeading: false,
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: "EASY",
                style: GoogleFonts.poppins(
                    color: myColor.textcolor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            const TextSpan(text: " "),
            TextSpan(
                text: "DINING",
                style: GoogleFonts.poppins(
                    color: myColor.maincolor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
          ])),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/admin_add_notification");
                },
                icon: Image.asset(
                  "assets/icons/ic_add_notification.png",
                  width: 25,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyBold.profile,
                  color: myColor.textcolor,
                  size: 30,
                )),
          ],
        ),
        backgroundColor: myColor.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomText(
              //       text: "Category",
              //       size: 23,
              //       weight: FontWeight.w500,
              //     )
              //   ],
              // ),

              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/ic_add_food.png",
                              width: 30),
                          const CustomText(
                            text: "Add Food",
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      )),
                    ),
                    Container(
                      width: 100.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/ic_user_review.png",
                              width: 30),
                          const CustomText(
                            text: "Reviews",
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      )),
                    ),
                    Container(
                      width: 100.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/ic_add_offer.png",
                              width: 30),
                          const CustomText(
                            text: "Add Offers",
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
