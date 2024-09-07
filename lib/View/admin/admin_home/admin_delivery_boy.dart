import 'package:easy_dine_in/View/admin/admin_home/admin_db_accepted.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_db_requested.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_deliveryBoy extends StatefulWidget {
  const admin_deliveryBoy({super.key});

  @override
  State<admin_deliveryBoy> createState() => _admin_deliveryBoyState();
}

class _admin_deliveryBoyState extends State<admin_deliveryBoy> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: myColor.background,
        appBar: AppBar(
          backgroundColor: myColor.background,
          title: const CustomText(
            text: "Delivery Boy",
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
                    text: "Accepted",
                    size: 20,
                  ),
                  CustomText(text: "Requested", size: 20),
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
