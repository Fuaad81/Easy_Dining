import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_addNotification extends StatefulWidget {
  const admin_addNotification({super.key});

  @override
  State<admin_addNotification> createState() => _admin_addNotificationState();
}

class _admin_addNotificationState extends State<admin_addNotification> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titlecontroller = TextEditingController();
    final TextEditingController discriptioncontroller = TextEditingController();
    return Scaffold(
      
      appBar: AppBar(
        
        title:   CustomText(text: "Add Notification", size: 21.spMin),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h),
          child: Column(
            children: [
              SizedBox(
                  width: 320.w,
                  child: CustomTextFormField(
                    controller: titlecontroller,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    hintText: "Title",
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                    width: 320.w,
                    child: CustomTextFormField(
                      controller: discriptioncontroller,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      hintText: "Desription...",
                      maxLines: 10,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(myColor.maincolor),
                        foregroundColor:
                            WidgetStatePropertyAll(myColor.background),
                        minimumSize: WidgetStatePropertyAll(Size(300.w, 60.h)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)))),
                    onPressed: () {},
                    child: CustomText(text: "Submit", size: 18.spMin)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
