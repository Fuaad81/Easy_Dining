import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class admin_addFood extends StatefulWidget {
  const admin_addFood({super.key});

  @override
  State<admin_addFood> createState() => _admin_addFoodState();
}

class _admin_addFoodState extends State<admin_addFood> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController foodprizecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  XFile? pick;
  File? image;
  var imageUrl;

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

  Future<void> saveData() async {
    try {
      await FirebaseFirestore.instance.collection("addFood").add({
        "foodname": namecontroller.text,
        "foodprize": foodprizecontroller.text,
        "category": selectedCategory,
        "discription": descriptioncontroller.text,
        "imageurl": imageUrl.toString()
      });
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> saveImage() async {
    if (image != null) {
      try {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child("foodImage")
            .child(DateTime.now().microsecondsSinceEpoch.toString());
        await ref.putFile(image!);
        var imgurl = await ref.getDownloadURL();
        setState(() {
          imageUrl = imgurl;
        });

        print(imgurl);
      } catch (e) {
        print(e);
      }
    }
  }

  String? selectedCategory;
  final List<String> category = ["Break Fast", "Lunch", "Snack", "Dinner"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add Food Item",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      addImage();
                    },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "type food name!";
                              }
                              return null;
                            },
                            filled: true,
                            fillColor: myColor.fieldbackground,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r)),
                            hintText: "Food Name",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "type your prize!";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            filled: true,
                            fillColor: myColor.fieldbackground,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r)),
                            hintText: "Food Prize",
                            controller: foodprizecontroller))
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
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "select your category!";
                            }
                            return null;
                          },
                          items: category.map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (String? newvalue) {
                            setState(() {
                              selectedCategory = newvalue;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: myColor.fieldbackground,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r)),
                            hintText: "Category",
                          ),
                        ))
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "type your discription!";
                              }
                              return null;
                            },
                            filled: true,
                            maxLines: 7,
                            fillColor: myColor.fieldbackground,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r)),
                            hintText: "Description",
                            controller: descriptioncontroller))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r))),
                            backgroundColor:
                                WidgetStatePropertyAll(myColor.maincolor),
                            foregroundColor:
                                WidgetStatePropertyAll(myColor.background),
                            minimumSize:
                                WidgetStatePropertyAll(Size(200.w, 50.h))),
                        onPressed: () {
                          // Navigator.pushNamed(context, "");
                          if (formkey.currentState!.validate()) {
                            saveData();
                            saveImage();
                          }
                          print(selectedCategory);
                        },
                        child: CustomText(
                          text: "Submit",
                          size: 25.spMin,
                          weight: FontWeight.w600,
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
