import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_History extends StatefulWidget {
  const admin_History({super.key});

  @override
  State<admin_History> createState() => _admin_HistoryState();
}

class _admin_HistoryState extends State<admin_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booked Table'),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("bookTable").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: CustomText(
                    text: "No Data Available!!",
                    size: 20.spMin,
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: data["profileImage"] != null &&
                                    data["profileImage"] != "null"
                                ? NetworkImage(data[
                                    "profileImage"]!)
                                : null,
                          ),
                        ),
                        InkWell(
                          onTap: ()=>  Navigator.pushNamed(context,"/admin_bookedtab",arguments: {"data" : data}),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Container(
                              width: 310.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 2,
                                      // spreadRadius: 0.3
                                    )
                                  ],
                                  color: myColor.background,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.h, left: 15.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: data["name"],
                                          size: 20.spMin,
                                          weight: FontWeight.w500,
                                        ),
                                        CustomText(
                                          text: data["email"],
                                          size: 16.spMin,
                                          weight: FontWeight.w400,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: CustomText(
                                            text: "Table no: ${data["table no"]}",
                                            size: 18.spMin,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.h),
                                          child: CustomText(
                                            text: data["occation"],
                                            size: 18.spMin,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.h, bottom: 5.h),
                                          child: CustomText(
                                            text: "₹${data["table prize"]}-/",
                                            size: 18.spMin,
                                            weight: FontWeight.w400,
                                            
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.h, right: 15.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconlyLight.location,
                                                size: 20,
                                              ),
                                              CustomText(
                                                  text: data["location"],
                                                  size: 18.spMin),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.network(
                                                data["table image"],
                                                width: 120.w,
                                                height: 100.h,
                                                fit: BoxFit.cover,
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
