import 'package:easy_dine_in/View/admin/admin_home/admin_db_accepted.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_db_requested.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_deliveryBoy_Tab extends StatefulWidget {
  const admin_deliveryBoy_Tab({super.key});

  @override
  State<admin_deliveryBoy_Tab> createState() => _admin_deliveryBoy_TabState();
}

class _admin_deliveryBoy_TabState extends State<admin_deliveryBoy_Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          
          title:   CustomText(
            text: "Delivery Boy",
            size: 21.spMin,
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
                tabs: [
                  CustomText(
                    text: "Accepted",
                    size: 20.spMin,
                  ),
                  CustomText(text: "Requested", size: 20.spMin),
                ]),
            const Expanded(
              child: TabBarView(
                  children: [admin_db_Accepted(), admin_db_Requested()]),
            )
          ],
        ),
      ),
    );
  }
}
