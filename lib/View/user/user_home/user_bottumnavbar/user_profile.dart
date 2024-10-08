import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class user_Profile extends StatefulWidget {
  const user_Profile({super.key});

  @override
  State<user_Profile> createState() => _user_ProfileState();
}

class _user_ProfileState extends State<user_Profile> {
  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> fetchProfile() async {

    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userdata = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get();
      setState(() {
        nameController.text = userdata["name"] ?? "null";
        emailController.text = userdata["email"] ?? "null";
        numberController.text = userdata["number"] ?? "null";
        addressController.text = userdata["address"] ?? "null";
      });
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CustomText(
            text: "Profile",
            size: 21.spMin,
            letterSpacing: 1,
            weight: FontWeight.w500,
            textStyle: const TextStyle(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/user_editprofile");
                },
                icon: const Icon(
                  IconlyLight.edit_square,
                  size: 25,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: myColor.tabcolor,
                    radius: 50,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: nameController,
                      prefixIcon: const Icon(
                        IconlyLight.profile,
                        size: 20,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(fontSize: 18.spMin)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: emailController,
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 20,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 18.spMin)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: numberController,
                      prefixIcon: const Icon(
                        IconlyLight.call,
                        size: 20,
                      ),
                      hintText: "Number",
                      hintStyle: TextStyle(fontSize: 18.spMin)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: CustomTextFormField(
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      readOnly: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: addressController,
                      prefixIcon: const Icon(
                        IconlyLight.location,
                        size: 20,
                      ),
                      hintText: "Address",
                      hintStyle: TextStyle(fontSize: 18.spMin)),
                ),
              ),
            ],
          ),
        ));
  }
}
