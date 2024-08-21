// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

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
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: myColor.background,
        appBar: AppBar(
          backgroundColor: myColor.background,
          titleSpacing: -5,
          toolbarHeight: ScreenUtil().setHeight(70),
          leading: IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(CupertinoIcons.line_horizontal_3_decrease)),
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: "Hello",
                style: GoogleFonts.pacifico(
                  fontSize: 24,
                )),
            TextSpan(text: " "),
            TextSpan(
              text: "Name",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: myColor.maincolor,
                  fontWeight: FontWeight.w400),
            ),
            TextSpan(text: ","),
          ])),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/notification.png",
                  width: ScreenUtil().setWidth(25),
                ))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(330),
                  height: ScreenUtil().setHeight(45),
                  child: CustomTextFormField(
                      controller: _search,
                      labelText: CustomText(
                        text: "search..",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: myColor.textcolor),
                      suffixIcon: Icon(IconlyLight.search)),
                ),
              ],
            ),
            TabBar(
                padding: EdgeInsets.only(left: 15, top: 15),
                dividerColor: myColor.background,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelStyle: GoogleFonts.poppins(
                  color: myColor.background,
                ),
                tabAlignment: TabAlignment.center,
                indicator: BoxDecoration(
                    color: myColor.maincolor,
                    borderRadius: BorderRadius.circular(10)),
                tabs: [
                  CustomText(
                    text: "All",
                    size: 18,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  CustomText(
                    text: "Break Fast",
                    size: 18,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  CustomText(
                    text: "Lunch",
                    size: 18,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  CustomText(
                    text: "Snack",
                    size: 18,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                  CustomText(
                    text: "Dinner",
                    size: 18,
                    weight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                allItem(),
                breakFast(),
                lunchItem(),
                snackItem(),
                dinnerItem()
              ]),
            )
          ],
        ),
        drawer: Drawer(
          shape: BeveledRectangleBorder(),
          backgroundColor: myColor.background,
          child: ListView(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: myColor.maincolor),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.moon_stars,
                    color: myColor.background,
                    size: 35,
                  ),
                )
              ],
              currentAccountPicture: Container(
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      color: myColor.background,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(IconlyBold.profile)),
              accountName: CustomText(
                text: "Name",
                size: 20,
                color: myColor.background,
                weight: FontWeight.w500,
                textAlign: TextAlign.center,
                textStyle: TextStyle(),
              ),
              accountEmail: CustomText(
                text: "sample@gmail.com",
                size: 20,
                color: myColor.background,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
                textStyle: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  IconlyLight.setting,
                  size: 30,
                ),
                title: CustomText(
                  text: "Account Settings",
                  size: 20,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: TextStyle(),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/settings");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  IconlyLight.heart,
                  size: 30,
                ),
                title: CustomText(
                  text: "Favorite",
                  size: 20,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.square_list,
                  size: 30,
                ),
                title: CustomText(
                  text: "Order List",
                  size: 20,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  IconlyLight.location,
                  size: 30,
                ),
                title: CustomText(
                  text: "Location",
                  size: 20,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.captions_bubble,
                  size: 30,
                ),
                title: CustomText(
                  text: "Feedback",
                  size: 20,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: TextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(
                  IconlyLight.info_circle,
                  size: 30,
                ),
                title: CustomText(
                  text: "About",
                  size: 20,
                  color: myColor.textcolor,
                  weight: FontWeight.w400,
                  textStyle: TextStyle(),
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
