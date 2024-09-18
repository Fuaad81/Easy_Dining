import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_Theme extends StatefulWidget {
  const user_Theme({super.key});

  @override
  State<user_Theme> createState() => _user_ThemeState();
}

class _user_ThemeState extends State<user_Theme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Theme", size: 20.spMin),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          children: [
            ListTile(
              
              title: CustomText(text: "Light Mode", size: 20.spMin,),
            ),
            TextButton(onPressed: (){}, child: CustomText(text: "Light Mode", size: 20.spMin,)),
            
          ],
        ),
      ),
    );
  }
}