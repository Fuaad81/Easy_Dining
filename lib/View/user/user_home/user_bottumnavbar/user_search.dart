import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_Search extends StatefulWidget {
  const user_Search({super.key});

  @override
  State<user_Search> createState() => _user_SearchState();
}

class _user_SearchState extends State<user_Search> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        title: const CustomText(text: "Search", size: 21),
        centerTitle: true,
        bottom: PreferredSize(preferredSize: const Size(0, 50), child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: CustomTextFormField(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none
                    ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      controller: _search,
                      labelText: CustomText(
                        text: "search..",
                        size: 18,
                        color: myColor.textcolor,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(),
                      ),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: myColor.textcolor),
                      suffixIcon: Icon(IconlyLight.search,size: 25.w,)),
                ),
              ],
            ),),
      ),
    );
  }
}