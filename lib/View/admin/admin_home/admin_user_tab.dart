import 'package:easy_dine_in/View/admin/admin_home/admin_order_list.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_user_list.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_User_Tab extends StatefulWidget {
  const admin_User_Tab({super.key});

  @override
  State<admin_User_Tab> createState() => _admin_User_TabState();
}

class _admin_User_TabState extends State<admin_User_Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          
          title: const CustomText(
            text: "Users",
            size: 21,
            weight: FontWeight.w500,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
                padding: EdgeInsets.only(top: 20.h),
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                    color: myColor.maincolor,
                    borderRadius: BorderRadius.circular(10.r)),
                labelPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                indicatorColor: myColor.maincolor,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                labelColor: myColor.background,
                tabs: const [
                  CustomText(
                    text: "User List",
                    size: 20,
                  ),
                  CustomText(text: "Order List", size: 20),
                ]),
            const Expanded(
              child: TabBarView(
                  children: [admin_User_List(),admin_Order_List()]),
            )
          ],
        ),
      ),
    );
  }
}