// ignore_for_file: prefer__ructors, avoid_unnecessary_containers

import 'package:easy_dine_in/View/home/tabs/All.dart';
import 'package:easy_dine_in/View/home/tabs/breakfast.dart';
import 'package:easy_dine_in/View/home/tabs/dinner.dart';
import 'package:easy_dine_in/View/home/tabs/lunch.dart';
import 'package:easy_dine_in/View/home/tabs/snack.dart';
import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:easy_dine_in/model/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          titleSpacing: -5,
          toolbarHeight: 70.h,
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Image.asset(
                "assets/icons/ic_drawer.png",
                width: 25.w,
              )),
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: "Hello",
                style: GoogleFonts.pacifico(
                  fontSize: 24.sp,
                )),
            const TextSpan(text: " "),
            TextSpan(
              text: "Name",
              style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  color: myColor.maincolor,
                  fontWeight: FontWeight.w400),
            ),
            const TextSpan(text: ","),
          ])),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/icons/ic_notification.png",
                  width: 25.w,
                ))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 330.w,
                    height: 50.h,
                    child: CustomTextFormField(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        controller: _search,
                        labelText: CustomText(
                          text: "search..",
                          size: 18.sp,
                          color: myColor.textcolor,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(),
                        ),
                        labelStyle: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: myColor.textcolor),
                        suffixIcon: Icon(IconlyLight.search,size: 25.w,)),
                  ),
                ],
              ),
            ),
            TabBar(
                padding: EdgeInsets.only(left: 15.w, top: 10.h),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelStyle: GoogleFonts.poppins(
                  color: myColor.background,
                ),
                tabAlignment: TabAlignment.center,
                indicator: BoxDecoration(
                    color: myColor.maincolor,
                    borderRadius: BorderRadius.circular(10.r)),
                tabs: [
                  CustomText(
                    text: "All",
                    size: 18.sp,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  CustomText(
                    text: "Break Fast",
                    size: 18.sp,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  CustomText(
                    text: "Lunch",
                    size: 18.sp,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  CustomText(
                    text: "Snack",
                    size: 18.sp,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                  CustomText(
                    text: "Dinner",
                    size: 18.sp,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(),
                  ),
                ]),
            const Expanded(
              child: TabBarView(children: [
                allItem(),
                breakFast(),
                lunchItem(),
                snackItem(),
                dinnerItem()
              ]),
            ),
          ],
        ),
        drawer: Drawer(
          shape: const BeveledRectangleBorder(),
          child: ListView(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: myColor.maincolor),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.moon_stars,
                    color: myColor.background,
                    size: 35.w,
                  ),
                )
              ],
              currentAccountPicture: Container(
                  width:100.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: myColor.background,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Icon(IconlyBold.profile,size: 30.w,)),
              accountName: CustomText(
                text: "Name",
                size: 20.sp,
                color: myColor.background,
                weight: FontWeight.w500,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
              accountEmail: CustomText(
                text: "sample@gmail.com",
                size: 20.sp,
                color: myColor.background,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListTile(
                leading: Icon(
                  IconlyLight.setting,
                  size: 25.w,
                ),
                title: CustomText(
                  text: "Account Settings",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: const TextStyle(),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/settings");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListTile(
                leading: Icon(
                  IconlyLight.heart,
                  size: 25.w,
                ),
                title: CustomText(
                  text: "Favorite",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: const TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.square_list,
                  size: 25.w,
                ),
                title: CustomText(
                  text: "Order List",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: const TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListTile(
                leading: Icon(
                  IconlyLight.location,
                  size: 25.w,
                ),
                title: CustomText(
                  text: "Location",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: const TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListTile(
                leading:  Icon(
                  CupertinoIcons.captions_bubble,
                  size: 25.w,
                ),
                title: CustomText(
                  text: "Feedback",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: const TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListTile(
                leading: Icon(
                  IconlyLight.info_circle,
                  size: 25.w,
                ),
                title: CustomText(
                  text: "About",
                  size: 20.sp,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: const TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
