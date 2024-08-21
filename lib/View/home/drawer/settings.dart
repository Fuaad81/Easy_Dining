// ignore_for_file: prefer_const_constructors

import 'package:easy_dine_in/model/style/color.dart';
import 'package:easy_dine_in/model/widget/customtext.dart';
import 'package:flutter/material.dart';

class accountSetting extends StatefulWidget {
  const accountSetting({super.key});

  @override
  State<accountSetting> createState() => _accountSettingState();
}

class _accountSettingState extends State<accountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: CustomText(
          text: "Account Settings",
          size: 24,
          color: myColor.textcolor,
          weight: FontWeight.w400,
          textStyle: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: CircleAvatar(
                backgroundColor: myColor.tabcolor,
                radius: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child:CustomText(
                        text: "Name",
                        size: 22,
                        color: myColor.textcolor,
                        weight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child:CustomText(
                        text: "sample@gmail.com",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(),
                      ),
            ),
          ),
          
        ],
      ),
    );
  }
}
