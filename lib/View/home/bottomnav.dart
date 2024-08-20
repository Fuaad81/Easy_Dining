// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_dine_in/View/home/booking.dart';
import 'package:easy_dine_in/View/home/cart.dart';
import 'package:easy_dine_in/View/home/home.dart';
import 'package:easy_dine_in/View/home/profile.dart';
import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class bottomNavbar extends StatefulWidget {
  const bottomNavbar({super.key});

  @override
  State<bottomNavbar> createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  int index = 0;
  List<dynamic> pages = [Home(), Booking(), Cart(),Profile()];
  void itemTap(int ind) {
    setState(() {
      index = ind;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: ScreenUtil().setHeight(50),
        buttonBackgroundColor: myColor.maincolor,
        backgroundColor: Colors.transparent,
        onTap: itemTap,
        index: index,
        items: [
        Icon(IconlyLight.home,size: 30,),
        Image.asset("assets/images/table.png",width: ScreenUtil().setWidth(30),),
        Icon(CupertinoIcons.shopping_cart,size: 30,),
        Icon(IconlyLight.profile,size: 30,),
      ]),
      body: pages.elementAt(index),
    );
  }
}