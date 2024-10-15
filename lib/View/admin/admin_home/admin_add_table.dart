import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AdminAddTable extends StatefulWidget {
  const AdminAddTable({super.key});

  @override
  State<AdminAddTable> createState() => _AdminAddTableState();
}

class _AdminAddTableState extends State<AdminAddTable> {
  
  XFile? pick;
  File? image;
  String? imagelink;

  // Future<void> pickimage() async {
  //   try {
  //     ImagePicker picked = ImagePicker();
  //     pick = await picked.pickImage(source: ImageSource.gallery);
  //     if (pick != null) {
  //       setState(() {
  //         image = File(pick!.path);
  //       });
  //     }
  //   } catch (e) {
  //     print("error : $e");
  //   }
  // }
  Future<void> pickimage() async {
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


  // Future<void> saveImage() async {
  //   if (image != null) {
  //     try {
  //         String fileExtension = path.extension(image!.path);
  //       final ref = firebase_storage.FirebaseStorage.instance
  //           .ref()
  //           .child("tableImage")
  //           .child("${DateTime.now().microsecondsSinceEpoch}$fileExtension");
  //       firebase_storage.UploadTask uploadTask = ref.putFile(image!);
  //             await uploadTask.whenComplete(() => print("Upload Complete"));

  //       await uploadTask;
  //       final imgurl = await ref.getDownloadURL();
  //       setState(() {
  //         imagelink = imgurl;
  //       });
  //     } catch (e) {
  //       print(e);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: CustomText(text: "error: $e", size: 20.spMin)));
  //     }
  //   }
  // }
  Future<void> saveImage() async {
    if (image != null) {
      try {
        String fileExtension = path.extension(image!.path);
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("tableImage")
            .child("${DateTime.now().microsecondsSinceEpoch}$fileExtension");
        firebase_storage.UploadTask uploadTask = ref.putFile(image!);
        await uploadTask.whenComplete(() => print("Upload Complete"));
        await uploadTask;
        final imgurl = await ref.getDownloadURL();
        setState(() {
          imagelink = imgurl;
        });
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: CustomText(text: "error: $e", size: 20.spMin)));
      }
    }
  }

  Future<void> savedetails() async {
    try {

      if (imagelink == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                CustomText(text: "Please select an image", size: 20.spMin)));
        return;
      }
      await FirebaseFirestore.instance.collection("addTable").add({
        "table_no": namecontroller.text,
        "prize": prizecontroller.text,
        "imageUrl": imagelink ?? ''
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "error: $e", size: 20.spMin)));
    }
  }

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController prizecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add Table",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: pickimage,
                  child: Container(
                    width: 320.w,
                    height: 230.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: myColor.fieldbackground),
                    child: image == null
                        ? Icon(
                            Icons.add_a_photo_outlined,
                            size: 80,
                            color: myColor.tabcolor,
                          )
                        : Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 320.w,
                      child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r)),
                          hintText: "Table No",
                          controller: namecontroller))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 320.w,
                      child: CustomTextFormField(
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r)),
                          hintText: "Table Prize",
                          keyboardType: TextInputType.number,
                          controller: prizecontroller))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(myColor.maincolor),
                          foregroundColor:
                              WidgetStatePropertyAll(myColor.background),
                          minimumSize:
                              WidgetStatePropertyAll(Size(200.w, 50.h)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)))),
                      onPressed: () {
                        savedetails();
                        saveImage();
                        // Navigator.pop(context);
                      },
                      child: CustomText(text: "Submit", size: 20.spMin)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
