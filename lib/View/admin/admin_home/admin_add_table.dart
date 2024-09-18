import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_addTable extends StatefulWidget {
  const admin_addTable({super.key});

  @override
  State<admin_addTable> createState() => _admin_addTableState();
}

class _admin_addTableState extends State<admin_addTable> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();

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
                          controller: namecontroller))
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
                           minimumSize: WidgetStatePropertyAll(Size(200.w, 50.h)),
                           shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10.r)))),
                       onPressed: () {},
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
