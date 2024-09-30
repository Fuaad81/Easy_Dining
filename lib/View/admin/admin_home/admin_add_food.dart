import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_addFood extends StatefulWidget {
  const admin_addFood({super.key});

  @override
  State<admin_addFood> createState() => _admin_addFoodState();
}

class _admin_addFoodState extends State<admin_addFood> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();

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
                      child: DropdownButtonFormField(
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
    );
  }
}
