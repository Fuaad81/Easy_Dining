import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminBookedTabDetails extends StatefulWidget {
  const AdminBookedTabDetails({super.key});

  @override
  State<AdminBookedTabDetails> createState() => _AdminBookedTabDetailsState();
}

class _AdminBookedTabDetailsState extends State<AdminBookedTabDetails> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Table Details", size: 21.spMin),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    data["table image"],
                    width: 350.w,
                    height: 360.h,
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: data["profileImage"] != null &&
                          data["profileImage"] != "null"
                      ? NetworkImage(data["profileImage"]!)
                      : null,
                ),
                title: CustomText(
                  text: data["name"],
                  size: 18.spMin,
                  weight: FontWeight.w500,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      
                      child: Center(child: CustomText(text: data["status"], size: 18)),
                    )
                  ],
                ),
                subtitle: CustomText(text: data["email"], size: 18.spMin),
                
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  CustomText(text: "Table No: ", size: 22.spMin),
                  CustomText(
                    text: data["table no"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "Table prize: ", size: 22.spMin),
                  CustomText(
                    text: "₹${data["table prize"]}",
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "Category: ", size: 22.spMin),
                  CustomText(
                    text: data["category"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "Date: ", size: 22.spMin),
                  CustomText(
                    text: data["date"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "Start time: ", size: 22.spMin),
                  CustomText(
                    text: data["frometime"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "End time: ", size: 22.spMin),
                  CustomText(
                    text: data["totime"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "Number of seats: ", size: 22.spMin),
                  CustomText(
                    text: data["number of seat"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 10.h),
              child: Row(
                children: [
                  CustomText(text: "Occation: ", size: 22.spMin),
                  CustomText(
                    text: data["occation"],
                    size: 22.spMin,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
