import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_PayMethod extends StatefulWidget {
  const user_PayMethod({super.key});

  @override
  State<user_PayMethod> createState() => _user_PayMethodState();
}

class _user_PayMethodState extends State<user_PayMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Payment Method", size: 21.spMin,weight: FontWeight.w500,),
        centerTitle: true,
      ),
      
    );
  }
}