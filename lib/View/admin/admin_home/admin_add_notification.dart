import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_Add_Notification extends StatefulWidget {
  const admin_Add_Notification({super.key});

  @override
  State<admin_Add_Notification> createState() => _admin_Add_NotificationState();
}

class _admin_Add_NotificationState extends State<admin_Add_Notification> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titlecontroller = TextEditingController();
    final TextEditingController discriptioncontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Add Notification", size: 21),
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
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
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
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      fillColor: myColor.fieldbackground,
                      hintText: "Desription",
                      maxLines: 10,
                    )),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(myColor.maincolor),
                  foregroundColor: WidgetStatePropertyAll(myColor.background),
                ),
                onPressed: (){}, child: CustomText(text: "Submit", size: 18))
            ],
          ),
        ),
      ),
    );
  }
}
