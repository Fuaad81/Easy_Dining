import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_newTable extends StatefulWidget {
  const admin_newTable({super.key});

  @override
  State<admin_newTable> createState() => _admin_newTableState();
}

class _admin_newTableState extends State<admin_newTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: myColor.background,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 4),
                          blurRadius: 4,
                          color: myColor.tabcolor
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "Table No", size: 19),
                              CustomText(text: "Prize", size: 19),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 120.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: myColor.fieldbackground
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }
}