import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class dboy_Register extends StatefulWidget {
  const dboy_Register({super.key});

  @override
  State<dboy_Register> createState() => _dboy_RegisterState();
}

class _dboy_RegisterState extends State<dboy_Register> {
  final _namecontroler = TextEditingController();
  final _emailcontroler = TextEditingController();
  final _phonecontroler = TextEditingController();
  final _locationcontroler = TextEditingController();
  final _passwordcontroler = TextEditingController();
  final _licensecontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // File? _imageFile;
  // String? _licenseFileName;

  // Function to get location
  // Future<void> _getCurrentLocation() async {
  //   LocationPermission permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
  //     // Handle location permission denied
  //     return;
  //   }

  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     _locationcontroler.text = "${position.latitude}, ${position.longitude}";
  //   });
  // }

  // Function to pick an image
  // Future<void> _pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //       _licenseFileName = pickedFile.name;
  //       _licensecontroler.text = _licenseFileName!;
  //     });
  //   }
  // }

  // Function to upload the image to Firebase
  // Future<void> _uploadImageToFirebase() async {
  //   if (_imageFile == null) return;

  //   try {
  //     String fileName = _licenseFileName!;
  //     Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('licenses/$fileName');

  //     await firebaseStorageRef.putFile(_imageFile!);
  //     String downloadURL = await firebaseStorageRef.getDownloadURL();

  //     // Save the download URL to Firebase or Firestore if needed
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> addData() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailcontroler.text, password: _passwordcontroler.text);
      String? user = userCredential.user!.uid;
      FirebaseFirestore.instance.collection("dboyRegisterrq").doc(user).set({
        "name": _namecontroler.text,
        "email": _emailcontroler.text,
        "phone": _phonecontroler.text,
        "password": _passwordcontroler.text,
        "status" : "pending"
      });
      Navigator.pushNamed(context, "/db_accountcreated");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/deliveryboy.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color:
                    Colors.black.withOpacity(0), // Optional: add transparency
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: CustomText(
                        text: 'Register',
                        color: myColor.background,
                        size: 27.spMin,
                        weight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: CustomText(
                        text: 'Create Your Account...',
                        color: myColor.background,
                        size: 20.spMin,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          controller: _namecontroler,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          labelText: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: CustomText(
                              text: "Name",
                              size: 18.spMin,
                              weight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'enter name correctly';
                            }
                            return null;
                          },
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: myColor.textcolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none),
                          controller: _emailcontroler,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          labelText: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: CustomText(
                              text: "Email",
                              size: 18.spMin,
                              weight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'enter email correctly';
                            }
                            return null;
                          },
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: myColor.textcolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none),
                          controller: _phonecontroler,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          labelText: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: CustomText(
                              text: "Phone Number",
                              size: 18.spMin,
                              weight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'enter number correctly';
                            }
                            return null;
                          },
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: myColor.textcolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none),
                          controller: _locationcontroler,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          labelText: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: CustomText(
                              text: "Location",
                              size: 18.spMin,
                              weight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'enter current Location';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(IconlyLight.location)),
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: myColor.textcolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none),
                          controller: _licensecontroler,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          labelText: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: CustomText(
                              text: "License",
                              size: 18.spMin,
                              weight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'enter email correctly';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(IconlyBold.upload)),
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: myColor.textcolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        width: 335.w,
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none),
                          controller: _passwordcontroler,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          labelText: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: CustomText(
                              text: "Password",
                              size: 18.spMin,
                              weight: FontWeight.w400,
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'enter password correctly';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(IconlyLight.show)),
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: myColor.textcolor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  addData();
                                }
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all(myColor.maincolor),
                                foregroundColor:
                                    WidgetStateProperty.all(myColor.background),
                                minimumSize:
                                    WidgetStateProperty.all(Size(200.w, 50.h)),
                              ),
                              child: CustomText(
                                text: "Register",
                                size: 20.spMin,
                                color: myColor.background,
                                weight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Already have an account!",
                            size: 18.spMin,
                            weight: FontWeight.w400,
                            color: myColor.background,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/db_login');
                              },
                              child: CustomText(
                                text: "sign up",
                                size: 20.spMin,
                                color: myColor.maincolor,
                                weight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Divider(
                              color: myColor.background,
                              height: 20.h,
                              thickness: 2,
                              endIndent: 10.w,
                            ),
                          ),
                          CustomText(
                            text: "or login with",
                            size: 18.spMin,
                            weight: FontWeight.w400,
                            color: myColor.background,
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Divider(
                              color: myColor.background,
                              height: 20.h,
                              thickness: 2,
                              indent: 10.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/icons/ic_google.png",
                                width: 50.w,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/icons/ic_facebook.png",
                                width: 50.w,
                              ))
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
    );
  }
}