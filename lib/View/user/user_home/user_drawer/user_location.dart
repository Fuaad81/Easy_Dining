import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_Location extends StatefulWidget {
  const user_Location({super.key});

  @override
  State<user_Location> createState() => _user_LocationState();
}

class _user_LocationState extends State<user_Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Location", size: 21.spMin),
      ),
    );
  }
}