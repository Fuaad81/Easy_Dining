// ignore_for_file: prefer__ructors, avoid_unnecessary_containers

import 'package:easy_dine_in/Providers/theme_provider.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_all.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_breakfast.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_dinner.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_lunch.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_snack.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class user_Home extends StatefulWidget {
  const user_Home({super.key});

  @override
  State<user_Home> createState() => _user_HomeState();
}

class _user_HomeState extends State<user_Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          titleSpacing: -5,
          toolbarHeight: 60.h,
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
                  fontSize: 22.spMin,
                )),
            const TextSpan(text: " "),
            TextSpan(
              text: "Name",
              style: GoogleFonts.poppins(
                  fontSize: 22.spMin,
                  color: myColor.maincolor,
                  fontWeight: FontWeight.w400),
            ),
            const TextSpan(text: ","),
          ])),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/user_search");
              },
              icon: const Icon(
                IconlyLight.search,
                size: 25,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/user_notification");
                },
                icon: Image.asset(
                  "assets/icons/ic_notification.png",
                  width: 25.w,
                ))
          ],
        ),
        body: Column(
          children: [
            TabBar(
                padding: EdgeInsets.only(left: 15.w, top: 5.h),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelStyle: GoogleFonts.poppins(
                  color: myColor.background
                ),
                tabAlignment: TabAlignment.center,
                indicator: BoxDecoration(
                    color: myColor.maincolor,
                    borderRadius: BorderRadius.circular(10.r)),
                tabs: [
                  CustomText(
                    text: "All",
                    size: 18.spMin,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    text: "Break Fast",
                    size: 18.spMin,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    text: "Lunch",
                    size: 18.spMin,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    text: "Snack",
                    size: 18.spMin,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    text: "Dinner",
                    size: 18.spMin,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ]),
            const Expanded(
              child: TabBarView(children: [
                user_allItem(),
                user_breakFast(),
                user_lunchItem(),
                user_snackItem(),
                user_dinnerItem()
              ]),
            ),
            //chips
          ],
        ),
        drawer: Drawer(
          shape: const BeveledRectangleBorder(),
          child: ListView(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: myColor.maincolor),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    theme.toggleTheme();
                  },
                  icon: Icon(
                    CupertinoIcons.moon_stars,
                    color: myColor.background,
                    size: 35,
                  ),
                )
              ],
              currentAccountPicture: Container(
                  width: 100.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: myColor.background,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Icon(
                    IconlyBold.profile,
                    size: 30,
                    color: myColor.background,
                  )),
              accountName: CustomText(
                text: "Name",
                size: 20.spMin,
                color: myColor.background,
                weight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              accountEmail: CustomText(
                text: "sample@gmail.com",
                size: 20.spMin,
                color: myColor.background,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, "/user_settings");
                  
                },
                child: ListTile(
                  leading: const Icon(
                    IconlyLight.setting,
                    size: 25,
                  ),
                  title: CustomText(
                    text: "Account Settings",
                    size: 20.spMin,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, "/user_favorite");
                },
                child: ListTile(
                  leading: const Icon(
                    IconlyLight.heart,
                    size: 25,
                  ),
                  title: CustomText(
                    text: "Favorite",
                    size: 20.spMin,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);

                },
                child: ListTile(
                  leading: const Icon(
                    CupertinoIcons.square_list,
                    size: 25,
                  ),
                  title: CustomText(
                    text: "Order List",
                    size: 20.spMin,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);

                },
                child: ListTile(
                  leading: const Icon(
                    IconlyLight.location,
                    size: 25,
                  ),
                  title: CustomText(
                    text: "Location",
                    size: 20.spMin,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, "/user_feedback");
                },
                child: ListTile(
                  leading: const Icon(
                    CupertinoIcons.captions_bubble,
                    size: 25,
                  ),
                  title: CustomText(
                    text: "Feedback",
                    size: 20.spMin,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, "/user_about");
                },
                child: ListTile(
                  leading: const Icon(
                    IconlyLight.info_circle,
                    size: 25,
                  ),
                  title: CustomText(
                    text: "About",
                    size: 20.spMin,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
