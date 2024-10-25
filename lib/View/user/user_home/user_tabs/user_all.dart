// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class UserAllItem extends StatefulWidget {
  const UserAllItem({super.key});

  @override
  State<UserAllItem> createState() => _UserAllItemState();
}

class _UserAllItemState extends State<UserAllItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child:
              //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 10.w),
              //       child: Container(
              //         width: 320.w,
              //         height: 150.h,
              //         decoration: BoxDecoration(
              //             color: myColor.fieldbackground,
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(10.r))),
              //         child: Center(
              //             child: CustomText(text: "Offers", size: 30.spMin)),
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(left: 10.w),
              //       child: Container(
              //         width: 320.w,
              //         height: 150.h,
              //         decoration: BoxDecoration(
              //             color: myColor.fieldbackground,
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(10.r))),
              //         child: Center(
              //             child: CustomText(text: "Offers", size: 30.spMin)),
              //       ),
              //     ),
              //   ]),
              // ),
              SizedBox(
                height: 150.h,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("addOffer")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text(
                          'No offers available',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Container(
                            width: 320.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: myColor.fieldbackground,
                              image: DecorationImage(
                                image: NetworkImage(data["offerimage"]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("addFood")
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
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r)),
                                        child: Image.network(
                                          data["imageurl"],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: data["foodname"],
                                        size: 18.spMin,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7.w),
                                  child: CustomText(
                                    text: data["discription"],
                                    size: 16.spMin,
                                    textOverflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 7.w, top: 4.h, right: 7.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "₹${data["foodprize"]}",
                                        size: 16.spMin,
                                        textStyle: const TextStyle(),
                                        weight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        text: "${data["time"]} min",
                                        size: 14.spMin,
                                        textStyle: const TextStyle(),
                                        weight: FontWeight.w400,
                                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
