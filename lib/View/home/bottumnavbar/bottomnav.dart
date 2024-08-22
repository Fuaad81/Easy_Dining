// ignore_for_file: prefer__ructors, sized_box_for_whitespace

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/booking.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/cart.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/home.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/profile.dart';
import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bottomNavbar extends StatefulWidget {
   const bottomNavbar({super.key});

  @override
  State<bottomNavbar> createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  int index = 0;
  List<dynamic> pages = [const Home(), const Booking(), const Cart(),const Profile()];
  void itemTap(int ind) {
    setState(() {
      index = ind;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.h,
        buttonBackgroundColor: myColor.maincolor,
        color: myColor.background,
        
        backgroundColor: Colors.transparent,
        onTap: itemTap,
        index: index,
        items: [
        Image.asset("assets/icons/ic_home.png",width: 25.w,color: index == 0 ? myColor.background : myColor.textcolor,),
        Image.asset("assets/icons/ic_table.png",width: 25.w,color: index == 1 ? myColor.background : myColor.textcolor,),
        Image.asset("assets/icons/ic_cart.png",width: 25.w,color: index == 2 ? myColor.background : myColor.textcolor,),
        Image.asset("assets/icons/ic_profile.png",width: 25.w,color: index == 3 ? myColor.background : myColor.textcolor,),
        
      ]),
      body: pages.elementAt(index),
    );
  }
}