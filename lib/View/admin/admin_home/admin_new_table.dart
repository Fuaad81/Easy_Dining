import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder(
        
          stream: FirebaseFirestore.instance.collection("addTable").snapshots(),
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
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
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
                                      color: myColor.tabcolor)
                                ],
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: data["table_no"],
                                          size: 19.spMin),
                                      CustomText(
                                          text: data["prize"], size: 19.spMin),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    width: 120.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: myColor.fieldbackground),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        data["imageUrl"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            );
          }),
    );
  }
}
