import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_addOffer extends StatefulWidget {
  const admin_addOffer({super.key});

  @override
  State<admin_addOffer> createState() => _admin_addOfferState();
}

class _admin_addOfferState extends State<admin_addOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: const CustomText(
          text: "Add Offers",
          size: 21,
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
                    onTap: () {},
                    child: Container(
                      width: 320.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          color: myColor.tabcolor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Icon(
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
                  onPressed: () {},
                  child: const CustomText(text: "Submit", size: 20)))
        ],
      ),
    );
  }
}
