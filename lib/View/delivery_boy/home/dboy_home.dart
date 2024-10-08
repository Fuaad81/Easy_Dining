import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class dboy_Home extends StatefulWidget {
  const dboy_Home({super.key});

  @override
  State<dboy_Home> createState() => _dboy_HomeState();
}

class _dboy_HomeState extends State<dboy_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text.rich(TextSpan(children: [
          TextSpan(
            text: "Hi ",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 25.spMin),
          ),
          // TextSpan(
          //   text: " ",
          //   style: GoogleFonts.poppins(
          //     fontWeight: FontWeight.w500,
          //     fontSize: 25.spMin
          //   ),
          // ),
          TextSpan(
            text: "Name,",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 25.spMin,
                color: myColor.maincolor),
          ),
        ])),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h,bottom: 5.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: myColor.background,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            color: myColor.tabcolor,
                          )
                        ]),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 15.w, bottom: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: CustomText(
                                        text: "Name", size: 22.spMin),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: CustomText(
                                        text: "Food Name", size: 22.spMin),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: CustomText(
                                        text: "Location", size: 22.spMin),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: CustomText(
                                        text: "Prize", size: 22.spMin),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Container(
                                width: 140.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    color: myColor.tabcolor,
                                    borderRadius: BorderRadius.circular(10.r)),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: InkWell(
                                  onTap: () {
                                    print("clicked");
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        color: myColor.errortext,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Center(
                                      child: CustomText(
                                        text: "Ignore",
                                        size: 18.spMin,
                                        color: myColor.background,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("clicked");
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      color: myColor.successcolor,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                    child: CustomText(
                                      text: "Take Order",
                                      size: 18.spMin,
                                      color: myColor.background,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
