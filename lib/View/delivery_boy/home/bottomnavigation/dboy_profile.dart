import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:photo_view/photo_view.dart';

class dboy_Profile extends StatefulWidget {
  const dboy_Profile({super.key});

  @override
  State<dboy_Profile> createState() => _dboy_ProfileState();
}

class _dboy_ProfileState extends State<dboy_Profile> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController licensecontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  String image = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> fetchdata() async {
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("approveddboy")
          .doc(user.uid)
          .get();
      setState(() {
        namecontroller.text = documentSnapshot["name"] ?? "";
        emailcontroller.text = documentSnapshot["email"] ?? "";
        phonecontroller.text = documentSnapshot["phone"] ?? "";
        locationcontroller.text = documentSnapshot["location"] ?? "";
        image = documentSnapshot["image"] ?? "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  String _getImageName(String imageUrl) {
      if (imageUrl.isNotEmpty) {
        // Get the last part of the URL, which is the image name
        return imageUrl
            .split('/')
            .last; // This will split by '/' and take the last part
      }
      return "No image"; // Default hint if no image URL is available
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
          text: "Profile",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/db_editprofile");
              },
              icon: const Icon(IconlyLight.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Name",
                      size: 20.spMin,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: CustomTextFormField(
                        readOnly: true,
                        // hintText: "Name",
                        controller: namecontroller,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Email",
                      size: 20.spMin,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: CustomTextFormField(
                        readOnly: true,
                        // hintText: "sample@gmail.com",
                        controller: emailcontroller,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "License",
                      size: 20.spMin,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: CustomTextFormField(
                        readOnly: true,
                        hintText: _getImageName(image),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
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
                                                    NetworkImage(image),
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
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                  child: CustomText(
                                text: "view",
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
                  top: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Location",
                      size: 20.spMin,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: CustomTextFormField(
                        controller: locationcontroller,
                        readOnly: true,
                        // hintText: "Location",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Phone No",
                      size: 20.spMin,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: CustomTextFormField(
                        readOnly: true,
                        // hintText: "1234567890",
                        controller: phonecontroller,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
