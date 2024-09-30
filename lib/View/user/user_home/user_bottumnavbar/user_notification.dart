import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_notification extends StatefulWidget {
  const user_notification({super.key});

  @override
  State<user_notification> createState() => _user_notificationState();
}

class _user_notificationState extends State<user_notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Notification",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
            child: ListTile(
              tileColor: myColor.notification,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              title: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomText(
                  text: "⏳Limited-Time Deal",
                  size: 20.spMin,
                  weight: FontWeight.w500,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "hurry! enjoy 20% off salad items in this weakend.",
                  size: 18.spMin,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}