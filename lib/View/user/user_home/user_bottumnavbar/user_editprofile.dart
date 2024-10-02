import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:easy_dine_in/model/service_model/userModel/editprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_editProfile extends StatefulWidget {
  const user_editProfile({super.key});

  @override
  State<user_editProfile> createState() => _user_editProfileState();
}

class _user_editProfileState extends State<user_editProfile> {
  final _formkey = GlobalKey<FormState>();
  // final user_editProfile editprof = user_editProfile();
  final userModel usermodel = userModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> fetchProfile() async {
    await usermodel.fetchProfile();
    setState(() {
      nameController.text = usermodel.name ?? '';
      emailController.text = usermodel.email ?? '';
      numberController.text = usermodel.number ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Edit Profile",
          size: 20.spMin,
          textStyle: const TextStyle(),
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: myColor.fieldbackground,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    controller: nameController,
                    prefixIcon: const Icon(
                      IconlyLight.profile,
                      size: 20,
                    ),
                    hintText: "Name",
                  ),
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
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: emailController,
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 20,
                      ),
                      hintText: "Email",
                    )),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    controller: numberController,
                    prefixIcon: const Icon(
                      IconlyLight.call,
                      size: 20,
                    ),
                    hintText: "Number",
                  ),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    controller: addressController,
                    prefixIcon: const Icon(
                      IconlyLight.location,
                      size: 20,
                    ),
                    hintText: "Address",
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(IconlyLight.location)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                          backgroundColor:
                              WidgetStatePropertyAll(myColor.tabcolor),
                          foregroundColor:
                              WidgetStatePropertyAll(myColor.background),
                          minimumSize:
                              WidgetStatePropertyAll(Size(120.w, 40.h)),
                          textStyle: WidgetStatePropertyAll(
                              GoogleFonts.poppins(fontSize: 18)),
                        ),
                        child: CustomText(
                          text: "cancel",
                          size: 18.spMin,
                          color: myColor.textcolor,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          usermodel.name = nameController.text;
                          usermodel.email = emailController.text;
                          usermodel.number = numberController.text;
                          usermodel.updateUser().then((_) {
                            Navigator.pop(context);
                          });
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                          backgroundColor:
                              WidgetStatePropertyAll(myColor.maincolor),
                          foregroundColor:
                              WidgetStatePropertyAll(myColor.background),
                          minimumSize:
                              WidgetStatePropertyAll(Size(120.w, 40.h)),
                          textStyle: WidgetStatePropertyAll(
                              GoogleFonts.poppins(fontSize: 18)),
                        ),
                        child: CustomText(
                          text: "save",
                          size: 18.spMin,
                          color: myColor.background,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
