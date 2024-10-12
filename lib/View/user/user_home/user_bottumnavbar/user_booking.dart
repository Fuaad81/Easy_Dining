import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_Booking extends StatefulWidget {
  const user_Booking({super.key});

  @override
  State<user_Booking> createState() => _user_BookingState();
}

class _user_BookingState extends State<user_Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Booking",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/ic_notification.png",
                width: 30,
              ))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("addTable").snapshots(),
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
                padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                child: InkWell(
                  onTap: () {
                            Navigator.pushNamed(context, "/user_tabledetails",arguments: {"data" : data});
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
                                  data["imageUrl"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 7.w,
                            top: 5.h
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Table no ",
                                size: 18.spMin,
                                weight: FontWeight.w400,
                              ),
                              CustomText(
                                text: data["table_no"],
                                size: 18.spMin,
                                weight: FontWeight.w600,
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
                                text: "₹${data["prize"]}",
                                size: 18.spMin,
                                textStyle: const TextStyle(),
                                weight: FontWeight.w600,
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
    );
  }
}
