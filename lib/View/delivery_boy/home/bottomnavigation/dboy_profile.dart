import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class dboy_Profile extends StatefulWidget {
  const dboy_Profile({super.key});

  @override
  State<dboy_Profile> createState() => _dboy_ProfileState();
}

class _dboy_ProfileState extends State<dboy_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
          text: "Profile",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(IconlyLight.edit))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
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
                    width: 250.w,
                    child: CustomTextFormField(
                      readOnly: true,
                      hintText: "Name",
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
                    width: 250.w,
                    child: CustomTextFormField(
                      readOnly: true,
                      hintText: "sample@gmail.com",
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
                    width: 250.w,
                    child: CustomTextFormField(
                      readOnly: true,
                      hintText: "image",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {},
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
                    width: 250.w,
                    child: CustomTextFormField(
                      readOnly: true,
                      hintText: "Location",
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
                    width: 250.w,
                    child: CustomTextFormField(
                      readOnly: true,
                      hintText: "1234567890",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
