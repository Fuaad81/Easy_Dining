import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class admin_addTable extends StatefulWidget {
  const admin_addTable({super.key});

  @override
  State<admin_addTable> createState() => _admin_addTableState();
}

class _admin_addTableState extends State<admin_addTable> {
  XFile? pick;
  File? image;
  String? imageUrl;

  Future<void> addImage() async {
    try {
      ImagePicker picked = ImagePicker();
      pick = await picked.pickImage(source: ImageSource.gallery);
      if (pick != null) {
        setState(() {
          image = File(pick!.path);
        });
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> savedata() async {
    try {
      await FirebaseFirestore.instance.collection("addTable").add({
        "table_no": namecontroller.text,
        "prize": prizecontroller.text,
        "imageUrl": imageUrl.toString()
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "error: $e", size: 20.spMin)));
    }
  }

  Future<void> saveImage() async {
    if (image != null) {
      try {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("tableImage")
            .child(DateTime.now().microsecondsSinceEpoch.toString());
        await ref.putFile(image!);
        var imgurl = await ref.getDownloadURL();
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
                  onTap: addImage,
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
                        savedata();
                        saveImage();
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
