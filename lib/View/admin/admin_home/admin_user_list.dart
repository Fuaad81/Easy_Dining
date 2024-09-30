import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_User_List extends StatefulWidget {
  const admin_User_List({super.key});

  @override
  State<admin_User_List> createState() => _admin_User_ListState();
}

class _admin_User_ListState extends State<admin_User_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:CustomText(text:"User List",size:21.spMin)
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: myColor.background,
            ),
            title:   CustomText(text: "Name", size: 18.spMin,weight: FontWeight.w500,),
            subtitle:   CustomText(text: "sample@gmail.com", size: 14.spMin,weight: FontWeight.w400,),
            tileColor: myColor.fieldbackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)
            ),
            trailing: IconButton(onPressed: (){}, icon: const Icon(IconlyLight.arrow_right_2,size: 30,)),
          ),
        );
      },),
    );
  }
}