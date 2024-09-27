import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class dboy_History extends StatefulWidget {
  const dboy_History({super.key});

  @override
  State<dboy_History> createState() => _dboy_HistoryState();
}

class _dboy_HistoryState extends State<dboy_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 10.h, bottom: 5.h),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                                bottom: 10.h,
                                top: 20.h
                              ),
                              child: Container(
                                width: 130.w,
                                height: 130.h,
                                decoration: BoxDecoration(
                                    color: myColor.tabcolor,
                                    borderRadius:
                                        BorderRadius.circular(10.r)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
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
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w, bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("clicked");
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: myColor.successcolor,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Center(
                                    child: CustomText(
                                      text: "Placed",
                                      size: 18.spMin,
                                      color: myColor.background,
                                    ),
                                  ),
                                ),
                              ),
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
