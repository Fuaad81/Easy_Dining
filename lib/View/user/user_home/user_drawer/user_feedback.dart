import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class user_feedback extends StatefulWidget {
  const user_feedback({super.key});

  @override
  State<user_feedback> createState() => _user_feedbackState();
}

class _user_feedbackState extends State<user_feedback> {
  TextEditingController feedbackController = TextEditingController();
  double rating = 0.0;


  Future<void> addData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance.collection("Users").doc(user!.uid).get();
      final username = userDoc.data()?["name"] ?? "Unknown User";
      final useremail = userDoc.data()?["email"] ?? "Unknown Email";
      final userlocation = userDoc.data()?["address"] ?? "Unknown Location";
      final userprofile =  userDoc.data()?["imageUrl"] ?? "Unknown Profile";

    try {
      await FirebaseFirestore.instance.collection("feedback").add({
        "feedback": feedbackController.text,
        "rating": rating,
        "userId": user.uid,
        "timestamp": FieldValue.serverTimestamp(),
        "username" : username,
        "useremail" : useremail,
        "userlocation" : userlocation,
        "userprofile" : userprofile,
      }).then((_){
        Navigator.pop(context);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Feedback sent successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error sending feedback")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "FeedBack",
          size: 21.spMin,
          weight: FontWeight.w500,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child:
                  CustomText(text: "How do you rate this app?", size: 20.spMin),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 20.h),
              child: RatingBar.builder(
                glow: false,
                itemCount: 5,
                initialRating: 0,
                allowHalfRating: true,
                unratedColor: myColor.tabcolor,
                itemPadding: EdgeInsets.symmetric(horizontal: 7.w),
                itemBuilder: (context, index) {
                  return Icon(
                    IconlyBold.star,
                    color: myColor.maincolor,
                    fill: 1.0,
                  );
                },
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child:
                  CustomText(text: "Comment your experience", size: 20.spMin),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 15.h),
              child: SizedBox(
                width: 330.w,
                height: 250.h,
                child: CustomTextFormField(
                  filled: true,
                  fillColor: myColor.fieldbackground,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                  controller: feedbackController,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  hintText: "say somthing here...",
                  hintStyle: GoogleFonts.poppins(fontSize: 22.spMin),
                  maxLines: 10,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
                  backgroundColor: WidgetStatePropertyAll(myColor.tabcolor),
                  minimumSize: WidgetStatePropertyAll(Size(150.w, 45.h)),
                ),
                child: CustomText(
                  text: "Cancel",
                  size: 20.spMin,
                  color: myColor.textcolor,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(),
                )),
            ElevatedButton(
                onPressed: addData,
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
                  backgroundColor: WidgetStatePropertyAll(myColor.maincolor),
                  minimumSize: WidgetStatePropertyAll(Size(150.w, 45.h)),
                ),
                child: CustomText(
                  text: "send",
                  size: 20.spMin,
                  color: myColor.background,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(),
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
