import 'dart:io';

import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:easy_dine_in/model/service_model/userModel/editprofile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  final _formkey = GlobalKey<FormState>();
  final userModel usermodel = userModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> fetchProfile() async {
    await usermodel.fetchProfile();
    setState(() {
      nameController.text = usermodel.name ?? '';
      emailController.text = usermodel.email ?? '';
      numberController.text = usermodel.number ?? '';
      addressController.text = usermodel.address ?? '';
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File file) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('profile_images');
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

      usermodel.name = nameController.text;
      usermodel.email = emailController.text;
      usermodel.number = numberController.text;
      usermodel.address = addressController.text;
      usermodel.imageUrl = imageUrl; // Set the image URL in user model

      await usermodel.updateUser().then((_) {
        Navigator.pop(context);
      });
    }
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
                  child: InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: myColor.fieldbackground,
                      radius: 50,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : (usermodel.imageUrl != null
                              ? NetworkImage(usermodel.imageUrl!)
                              : null) as ImageProvider?,
                          child: _imageFile == null && usermodel.imageUrl == null
                            ? Icon(Icons.camera_alt, size: 30)
                            : Icon(IconlyLight.edit,color: myColor.background,size: 30,),
                    ),
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
                        onPressed: () {},
                        icon: const Icon(IconlyLight.location)),
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
                        onPressed: _updateProfile,
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
