import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart' as path;
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';

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

  XFile? pick;
  File? image;
  String? imageUrl;
  bool isLoading = false;

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker
          .pickImage(source: ImageSource.gallery)
          .catchError((error) {
        print("Error picking image: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error picking image: $error")),
        );
        return null;
      });

      if (pickedFile == null) {
        print("No image selected");
        return;
      }

      print("Image picked: ${pickedFile.path}");

      try {
        final CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: myColor.maincolor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              cropStyle: CropStyle.rectangle,
              aspectRatioPresets: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2
              ],
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              title: 'Crop Image',
            ),
          ],
        ).catchError((error) {
          print("Error cropping image: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error cropping image: $error")),
          );
          return null;
        });

        if (croppedFile != null) {
          setState(() {
            image = File(croppedFile.path);
            final String fileName = croppedFile.path.split('/').last;
            _licensecontroler.text = fileName;
          });
          print("Image cropped and set: ${croppedFile.path}");
        } else {
          print("Cropping cancelled by user");
        }
      } on PlatformException catch (e) {
        print("Platform exception during cropping: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")),
        );
      }
    } catch (e) {
      print("Unexpected error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred: $e")),
      );
    }
  }

  Future<void> saveImage() async {
    if (image != null) {
      try {
        String fileExtension = path.extension(image!.path);
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("dbprofile")
            .child("${DateTime.now().microsecondsSinceEpoch}$fileExtension");
        firebase_storage.UploadTask uploadTask = ref.putFile(image!);
        await uploadTask.whenComplete(() => print("Upload Complete"));
        await uploadTask;
        final imgurl = await ref.getDownloadURL();
        setState(() {
          imageUrl = imgurl;
        });
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: CustomText(text: "error: $e", size: 20.spMin)));
      }
    }
  }

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
        "image": imageUrl ?? '',
        "location": _locationcontroler.text,
        "status": "pending"
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register Requested")),
        );
      });
      Navigator.pushNamed(context, "/db_accountcreated");
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Show dialog if location services are disabled
      bool? turnOnLocation = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Enable Location Services"),
          content: Text(
              "Location services are disabled. Please enable them to continue."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Enable"),
            ),
          ],
        ),
      );

      // If the user agrees, open location settings
      if (turnOnLocation == true) {
        await Geolocator.openLocationSettings();
      } else {
        return;
      }
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permissions are denied")),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Location permissions are permanently denied. Please enable them in settings.")),
      );
      return;
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get the place name from the coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      setState(() {
        _locationcontroler.text =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not fetch location name")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                            hintText: "Name",
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
                            hintText: "Email",
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
                            hintText: "Phone Number",
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
                            hintText: "Location",
                            validator: (value) {
                              if (value == null) {
                                return 'enter current Location';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                                onPressed: getLocation,
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
                            hintText: "License",
                            validator: (value) {
                              if (value == null) {
                                return 'select image';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                                onPressed: pickImage,
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
                            hintText: "Password",
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
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true; // Start loading
                                  });
                                  try {
                                    await saveImage();
                                    await addData();
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Error: $e")),
                                    );
                                  } finally {
                                    setState(() {
                                      isLoading = false; // Stop loading
                                    });
                                  }
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
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color: myColor.background) // Show loader
                                  : CustomText(
                                      text: "Register",
                                      size: 20.spMin,
                                      color: myColor.background,
                                      weight: FontWeight.w400,
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
      ),
    );
  }
}
