import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class user_Profile extends StatefulWidget {
  const user_Profile({super.key});

  @override
  State<user_Profile> createState() => _user_ProfileState();
}

class _user_ProfileState extends State<user_Profile> {
  Future<void> fetchProfile() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    String? userid = sharedpref.getString("UserId");
    if (userid != null && userid.isNotEmpty) {
      try {
        DocumentSnapshot usersnap = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userid)
            .get();

        if (usersnap.exists) {
          setState(() {
            nameController.text = usersnap["name"] ?? "null";
            emailController.text = usersnap["email"] ?? "null";
            numberController.text = usersnap["number"] ?? "null";
            // emailController = usersnap["email"] ?? "null";
          });
        }
      } catch (e) {
        print(e);
      }
    }
  }
  

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchProfile();
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
