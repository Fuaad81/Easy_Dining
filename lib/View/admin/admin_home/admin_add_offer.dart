import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


class admin_addOffer extends StatefulWidget {
  const admin_addOffer({super.key});

  @override
  State<admin_addOffer> createState() => _admin_addOfferState();
}

class _admin_addOfferState extends State<admin_addOffer> {

  XFile? pick;
  File? image;
  String? imagelink;

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
  Future<void> saveImage() async {
    if (image != null) {
      try {
        String fileExtension = path.extension(image!.path);
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("offerimage")
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
      await FirebaseFirestore.instance.collection("addOffer").add({
        "offerimage": imagelink ?? ''
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "error: $e", size: 20.spMin)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add Offers",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => pickimage(),
                    child: Container(
                      width: 320.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          color: myColor.tabcolor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: image != null ? Image.file(image!,fit: BoxFit.cover,) : Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                        color: myColor.notification,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
              bottom: 25.h,
              left: 20.w,
              right: 20.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(myColor.maincolor),
                      foregroundColor:
                          WidgetStatePropertyAll(myColor.background),
                      minimumSize: WidgetStatePropertyAll(Size(300.w, 50.h)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  onPressed: () {
                    saveImage();
                    savedetails();
                  },
                  child: CustomText(text: "Submit", size: 20.spMin)))
        ],
      ),
    );
  }
}
