import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_db_Accepted extends StatefulWidget {
  const admin_db_Accepted({super.key});

  @override
  State<admin_db_Accepted> createState() => _admin_db_AcceptedState();
}

class _admin_db_AcceptedState extends State<admin_db_Accepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/admin_dbacptdet");
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              tileColor: myColor.tabcolor,
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: myColor.background,
                child: const Icon(IconlyBold.profile),
              ),
              title: const CustomText(text: "Name", size: 18),
              subtitle: const CustomText(text: "Location", size: 14),
              trailing: IconButton(onPressed: () {
                
              }, icon: const Icon(IconlyLight.arrow_right_2)),
            ),
          ),
        );
      },),
    );
  }
}