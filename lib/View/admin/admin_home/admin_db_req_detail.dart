import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class admin_Db_Req_Details extends StatefulWidget {
  const admin_Db_Req_Details({super.key});

  @override
  State<admin_Db_Req_Details> createState() => _admin_Db_Req_DetailsState();
}

class _admin_Db_Req_DetailsState extends State<admin_Db_Req_Details> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    String getImageName(String imageUrl) {
      if (imageUrl.isNotEmpty) {
        // Get the last part of the URL, which is the image name
        return imageUrl
            .split('/')
            .last; // This will split by '/' and take the last part
      }
      return "No image"; // Default hint if no image URL is available
    }

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Delivery Boy",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 320.w,
                    decoration: BoxDecoration(
                        color: myColor.tabcolor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Name",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  // hintText: "Name",
                                  initialValue: data["name"],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Email",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  // hintText: "sample@gmail.com",
                                  initialValue: data["email"],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Phone No",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  // hintText: "1234567890",\
                                  initialValue: data["phone"],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "License",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: getImageName(data["image"]),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                              appBar: AppBar(
                                                  title:
                                                      const Text("Image View")),
                                              body: PhotoView(
                                                imageProvider:
                                                    NetworkImage(data["image"]),
                                                minScale: PhotoViewComputedScale
                                                    .contained,
                                                maxScale: PhotoViewComputedScale
                                                        .covered *
                                                    2,
                                                heroAttributes:
                                                    const PhotoViewHeroAttributes(
                                                        tag: "imageHero"),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            color: myColor.maincolor,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: Center(
                                            child: CustomText(
                                          text: "open",
                                          size: 14.spMin,
                                          color: myColor.background,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, right: 30.w, left: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Location",
                                size: 20.spMin,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 150.w,
                                height: 40.h,
                                child: CustomTextFormField(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 8.0.w),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  hintText: data["location"],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          myColor.errortext),
                                      foregroundColor: WidgetStatePropertyAll(
                                          myColor.background),
                                      minimumSize: WidgetStatePropertyAll(
                                          Size(120.w, 40.h)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.r)))),
                                  onPressed: () {
                                    rejectRequest(data.id);
                                  },
                                  child: CustomText(
                                      text: "Reject", size: 20.spMin)),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          myColor.successcolor),
                                      foregroundColor: WidgetStatePropertyAll(
                                          myColor.background),
                                      minimumSize: WidgetStatePropertyAll(
                                          Size(120.w, 40.h)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.r)))),
                                  onPressed: () {
                                    approveRequest(context,data.id);
                                  },
                                  child: CustomText(
                                      text: "Accept", size: 20.spMin))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void approveRequest(context,String requestId) async {
  try {
    await FirebaseFirestore.instance
        .collection("dboyRegisterrq")
        .doc(requestId)
        .update({
      "status": "approved",
    });
    DocumentSnapshot details = await FirebaseFirestore.instance
        .collection("dboyRegisterrq")
        .doc(requestId)
        .get();
    await FirebaseFirestore.instance
        .collection("approveddboy")
        .doc(requestId)
        .set(details.data() as Map<String, dynamic>)
        .then((_) {
      FirebaseFirestore.instance
          .collection("dboyRegisterrq")
          .doc(requestId)
          .delete().then((_){
            Navigator.pop(context);
          });
    });

    // Send a notification to the user
    // await FirebaseFirestore.instance.collection("users").doc(requestId).update({
    //   "isAdmin": true,
    // });
  } catch (e) {
    // Handle error
    print(e);
  }
}

void rejectRequest(String requestId) async {
  try {
    await FirebaseFirestore.instance
        .collection("dboyRegisterrq")
        .doc(requestId)
        .update({
      "status": "rejected",
    });
  } catch (e) {
    // Handle error
    print(e);
  }
}
