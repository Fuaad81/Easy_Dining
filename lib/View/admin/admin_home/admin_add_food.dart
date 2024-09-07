import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_addFood extends StatefulWidget {
  const admin_addFood({super.key});

  @override
  State<admin_addFood> createState() => _admin_addFoodState();
}

class _admin_addFoodState extends State<admin_addFood> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController descriptioncontroller = TextEditingController();
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: const CustomText(
          text: "Add Food Item",
          size: 21,
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
                Container(
                  width: 320.w,
                  height: 230.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: myColor.fieldbackground),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 50,
                    color: myColor.tabcolor,
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
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r)),
                          hintText: "Food Prize",
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
                          hintText: "Category",
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
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r))),
                          backgroundColor:
                              WidgetStatePropertyAll(myColor.maincolor),
                          foregroundColor:
                              WidgetStatePropertyAll(myColor.background),
                          minimumSize:
                              WidgetStatePropertyAll(Size(200.w, 50.h))),
                      onPressed: () {
                        Navigator.pushNamed(context, "");
                      },
                      child: const CustomText(
                        text: "Submit",
                        size: 25,
                        weight: FontWeight.w600,
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
