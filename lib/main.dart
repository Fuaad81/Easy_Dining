// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/View/Login/login.dart';
import 'package:easy_dine_in/View/Register/register.dart';
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
        "/register": (context) => const Register(),
      },
      initialRoute: "/splash",
    );
  }
}
