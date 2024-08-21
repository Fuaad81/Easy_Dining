// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/View/Login/confirmpassword.dart';
import 'package:easy_dine_in/View/Login/forgotpassword.dart';
import 'package:easy_dine_in/View/Login/login.dart';
import 'package:easy_dine_in/View/Login/otp.dart';
import 'package:easy_dine_in/View/Register/createdsucces.dart';
import 'package:easy_dine_in/View/Register/register.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/booking.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/bottomnav.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/cart.dart';
import 'package:easy_dine_in/View/home/drawer/settings.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/home.dart';
import 'package:easy_dine_in/View/home/bottumnavbar/profile.dart';
import 'package:easy_dine_in/View/home/tabs/All.dart';
import 'package:easy_dine_in/View/home/tabs/breakfast.dart';
import 'package:easy_dine_in/View/home/tabs/dinner.dart';
import 'package:easy_dine_in/View/home/tabs/lunch.dart';
import 'package:easy_dine_in/View/home/tabs/snack.dart';
import 'package:easy_dine_in/View/onboard_screen/onboardscreen1.dart';
import 'package:easy_dine_in/View/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      splitScreenMode: true,
      minTextAdapt: true
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/splash": (context) => const Splash_screeen(),
        "/firstonboard": (context) => const First_Onboarding(),
        "/login": (context) => const Login_Page(),
        "/forgot": (context) => const forgotPassword(),
        "/otp": (context) => const Otp(),
        "/confirmpass": (context) => const changePassword(),
        "/register": (context) => const Register(),
        "/createsuccess": (context) => const createdSucces(),
        "/bottomnav": (context) => const bottomNavbar(),
        "/home": (context) => const Home(),
        "/tablebooking": (context) => const Booking(),
        "/cart": (context) => const Cart(),
        "/profile": (context) => const Profile(),
        "/all": (context) => const allItem(),
        "/breakfast": (context) => const breakFast(),
        "/lunch": (context) => const lunchItem(),
        "/snack": (context) => const snackItem(),
        "/dinner": (context) => const dinnerItem(),
        "/settings": (context) => const accountSetting(),
      },
      initialRoute: "/splash",
    );
  }
}
