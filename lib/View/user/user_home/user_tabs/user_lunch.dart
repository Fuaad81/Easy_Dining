// ignore_for_file: prefer__ructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_lunchItem extends StatefulWidget {
  const user_lunchItem({super.key});

  @override
  State<user_lunchItem> createState() => _user_lunchItemState();
}

class _user_lunchItemState extends State<user_lunchItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("addFood")
            .where("category", isEqualTo: "Lunch")
            .snapshots(),
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
                text: "No Items Available!!",
                size: 20.spMin,
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
                padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/user_fooddetails",
                        arguments: {"data": data});
                  },
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
                                    return const Icon(
                                      IconlyBroken.image,
                                      size: 30,
                                    );
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
                                text: "${data["time"]} min",
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
