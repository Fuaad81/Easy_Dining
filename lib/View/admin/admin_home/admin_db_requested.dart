import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_db_Requested extends StatefulWidget {
  const admin_db_Requested({super.key});

  @override
  State<admin_db_Requested> createState() => _admin_db_RequestedState();
}

class _admin_db_RequestedState extends State<admin_db_Requested> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/admin_dbreqdet");
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              tileColor: myColor.tabcolor,
              leading: CircleAvatar(
                radius: 30,
                
                child: const Icon(IconlyBold.profile),
              ),
              title:   CustomText(text: "Name", size: 18.spMin,weight: FontWeight.w500,),
              trailing: IconButton(onPressed: () {
                
              }, icon: const Icon(IconlyLight.arrow_right_2)),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 8.0.h),
            ),
          ),
        );
      },),
    );
  }
}