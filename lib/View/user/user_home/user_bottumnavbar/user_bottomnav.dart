// ignore_for_file: prefer__ructors, sized_box_for_whitespace

import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_booking.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_cart.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_home.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_profile.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_bottomNavbar extends StatefulWidget {
  const user_bottomNavbar({super.key});

  @override
  State<user_bottomNavbar> createState() => _user_bottomNavbarState();
}

class _user_bottomNavbarState extends State<user_bottomNavbar> {
  int _currentindex = 0;
  List<dynamic> pages = [
    const user_Home(),
    const user_Booking(),
    const user_Cart(),
    const user_Profile()
  ];
  void itemTap(int ind) {
    setState(() {
      _currentindex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: myColor.background,
              icon: Image.asset(
                _currentindex == 0 ?
                "assets/icons/ic_home_fill.png" :
                "assets/icons/ic_home_outline.png" 
                ,
               width:20.w,
                height: 20.h,
                color: _currentindex == 0 ? myColor.maincolor : myColor.textcolor,
              ),
              label: "home"),
          BottomNavigationBarItem(
            backgroundColor: myColor.background,
              icon: Image.asset(
                 _currentindex == 1 ?
                "assets/icons/ic_table_fill.png" :
                "assets/icons/ic_table_outline.png" 
                ,
                width:20.w,
                height: 20.h,
                color:
                    _currentindex == 1 ? myColor.maincolor : myColor.textcolor,
              ),
              label: "Book Table"),
          BottomNavigationBarItem(
            backgroundColor: myColor.background,
              icon: Image.asset(
                 _currentindex == 2 ?
                "assets/icons/ic_cart_fill.png" :
                "assets/icons/ic_cart_outline.png" 
                ,
                width:20.w,
                height: 20.h,
                color:
                    _currentindex == 2 ? myColor.maincolor : myColor.textcolor,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
            backgroundColor: myColor.background,
              icon: Image.asset(
                 _currentindex == 3 ?
                "assets/icons/ic_profile_fill.png" :
                "assets/icons/ic_profile_outline.png" 
                ,
                width:20.w,
                height: 20.h,
                color:
                    _currentindex == 3 ? myColor.maincolor : myColor.textcolor,
              ),
              label: "Profile")
        ],
        selectedItemColor: myColor.maincolor,
        unselectedItemColor: myColor.textcolor,
        currentIndex: _currentindex,
        
        onTap: itemTap,
        type: BottomNavigationBarType.shifting,
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 50.h,
      //   buttonBackgroundColor: myColor.maincolor,
      //   color: myColor.background,

      //   backgroundColor: Colors.transparent,
      //   onTap: itemTap,
      //   index: _currentindex,
      //   items: [
      //   Image.asset("assets/icons/ic_home.png",width: 25.w,color: index == 0 ? myColor.background : myColor.textcolor,),
      //   Image.asset("assets/icons/ic_table.png",width: 25.w,color: index == 1 ? myColor.background : myColor.textcolor,),
      //   Image.asset("assets/icons/ic_cart.png",width: 25.w,color: index == 2 ? myColor.background : myColor.textcolor,),
      //   Image.asset("assets/icons/ic_profile.png",width: 25.w,color: index == 3 ? myColor.background : myColor.textcolor,),

      // ]),
      body: pages.elementAt(_currentindex),
    );
  }
}