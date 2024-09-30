import 'package:easy_dine_in/View/admin/admin_home/admin_new_food.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_new_table.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
          
          leading: Padding(
            padding: EdgeInsets.only(top: 30.h,left: 10.w),
            child:   CustomText(text: "Location", size: 18.spMin),
          ),
          leadingWidth: 100.w,
          automaticallyImplyLeading: false,
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: "EASY",
                style: GoogleFonts.poppins(
                    color: myColor.textcolor,
                    fontSize: 25.spMin,
                    fontWeight: FontWeight.w500)),
            const TextSpan(text: " "),
            TextSpan(
                text: "DINING",
                style: GoogleFonts.poppins(
                    color: myColor.maincolor,
                    fontSize: 25.spMin,
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
            // Padding(
            //   padding: EdgeInsets.only(right: 10.w),
            //   child: InkWell(
            //     onTap: (){},
            //     child: CircleAvatar(
                  
            //       backgroundColor: myColor.fieldbackground,
            //       child: Icon(
            //             IconlyBold.profile,
            //             color: myColor.textcolor,
            //             size: 30,
            //           ),
            //     ),
            //   ),
            // ),
          ],
        ),
        
        body: Column(
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/admin_addfood");
                      },
                      child: Container(
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
                                width: 35),
                              CustomText(
                              text: "Add Food",
                              size: 16.spMin,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/admin_addtable");
                      },
                      child: Container(
                        width: 100.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/ic_add_table.png",
                                width: 35),
                              CustomText(
                              text: "Add Table",
                              size: 16.spMin,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/admin_addoffers");
                      },
                      child: Container(
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
                                width: 35),
                              CustomText(
                              text: "Add Offers",
                              size: 16.spMin,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h,),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/admin_deliveryboy_tab");
                      },
                      child: Container(
                        width: 100.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/ic_delivery_boy.png",
                                width: 35),
                              CustomText(
                              text: "Delivery Boy",
                              size: 16.spMin,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/admin_review");
                      },
                      child: Container(
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
                                width: 35),
                              CustomText(
                              text: "Reviews",
                              size: 16.spMin,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/admin_userlist");
                      },
                      child: Container(
                        width: 100.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/ic_users.png",
                                width: 35),
                              CustomText(
                              text: "Users",
                              size: 16.spMin,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child:   Row(
                children: [
                  CustomText(text: "New Items Added", size: 18.spMin),
                ],
              ),
            ),
            TabBar(
                padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: GoogleFonts.poppins(
                  color: myColor.background,
                ),
                labelPadding: EdgeInsets.symmetric(vertical: 10.h),
                indicator: BoxDecoration(
                    color: myColor.maincolor,
                    borderRadius: BorderRadius.circular(10.r)),
                tabs:   [
                  CustomText(text: "Food", size: 18.spMin),
                  CustomText(text: "Table", size: 18.spMin),
                ]),
            const Expanded(
              child: TabBarView(children: [
                admin_newFood(),
                admin_newTable()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
