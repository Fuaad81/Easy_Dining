// ignore_for_file: prefer__ructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_breakFast extends StatefulWidget {
  const user_breakFast({super.key});

  @override
  State<user_breakFast> createState() => _user_breakFastState();
}

class _user_breakFastState extends State<user_breakFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("addFood")
            .where("category", isEqualTo: "Break Fast")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: "No Data Availabe", size: 20.spMin),
              ),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 200.h,
            ),
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return Padding(
                padding: EdgeInsets.only(top: 10.h,left: 5.w,right: 5.w),
                child: customCard(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: SizedBox(
                            width: 150.w,
                            height: 120.h,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              child: Image.network(
                                data["imageurl"],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(IconlyBroken.image,size: 30,);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 7.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: data["foodname"],
                              size: 18.spMin,
                              weight: FontWeight.w600,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    IconlyLight.heart,
                                    size: 22,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'quantity',
                              size: 14.spMin,
                              textStyle: const TextStyle(),
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 7.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "₹${data["foodprize"]}",
                              size: 18.spMin,
                              textStyle: const TextStyle(),
                              weight: FontWeight.w600,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    IconlyLight.bag,
                                    size: 22,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
