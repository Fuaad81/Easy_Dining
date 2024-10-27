import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class dboy_EditProfile extends StatefulWidget {
  const dboy_EditProfile({super.key});

  @override
  State<dboy_EditProfile> createState() => _dboy_EditProfileState();
}

class _dboy_EditProfileState extends State<dboy_EditProfile> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController licensecontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  File? _imageFile;
  String? image;

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
        image = documentSnapshot["image"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> _pickImage() async {
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
              cropStyle: CropStyle.circle,
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
            _imageFile = File(croppedFile.path);
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

  Future<String?> _uploadImage(File file) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child("${DateTime.now().microsecondsSinceEpoch}.jpg");
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Image upload error: $e");
      return null;
    }
  }

  Future<void> _updateProfile() async {
    if (_formkey.currentState!.validate()) {
      // Upload image if selected
      String? imageUrl;
      if (_imageFile != null) {
        imageUrl = await _uploadImage(_imageFile!);
      }
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance
            .collection("approveddboy")
            .doc(user.uid)
            .update({
          'name': namecontroller.text,
          'email': emailcontroller.text,
          'phone': phonecontroller.text,
          'imageUrl': imageUrl ?? '',
        }).then((_) {
          Navigator.pop(context);
        }).catchError((e) {
          print("Error updating profile: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error updating profile: $e")),
          );
        });
      }
    }
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
          text: "Edit Profile",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                  ),
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
                    width: 230.w,
                    child: CustomTextFormField(
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
                    width: 230.w,
                    child: CustomTextFormField(
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
                    width: 230.w,
                    child: CustomTextFormField(
                      hintText: _getImageName(image!),
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
                                  appBar:
                                      AppBar(title: const Text("Image View")),
                                  body: PhotoView(
                                    imageProvider: NetworkImage(image!),
                                    minScale: PhotoViewComputedScale.contained,
                                    maxScale:
                                        PhotoViewComputedScale.covered * 2,
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
                    width: 230.w,
                    child: CustomTextFormField(
                      // hintText: "Location",
                      controller: locationcontroller,
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
                    width: 230.w,
                    child: CustomTextFormField(
                      // hintText: "1234567890",
                      controller: phonecontroller,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  )
                ],
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
                        minimumSize: WidgetStatePropertyAll(Size(120.w, 40.h)),
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
                      onPressed: _updateProfile,
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(120.w, 40.h)),
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
    );
  }
}
