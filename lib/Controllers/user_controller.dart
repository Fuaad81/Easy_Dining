import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/service_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(userModel user, BuildContext context) async {
    try {
      if (!user.terms!) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: CustomText(
                text: "You must accept the terms & condition",
                size: 18.spMin)));
        return;
      }
      if (user.password != user.confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                CustomText(text: "Password do not match", size: 18.spMin)));
        return;
      }
      //firebase authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      //save data to firebase 
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "name" : user.name,
        "email" : user.email,
        "number" : user.number,
        "password" : user.password,
        "confirmpassword" : user.confirmPassword,
        "terms" : user.terms,
        "uid": userCredential.user!.uid
      });
      Navigator.pushNamed(context, "/user_bottomnav");

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Registration success", size: 18.spMin))
        );
        return;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Error : ${e.toString()}", size: 18.spMin))
        );
        return;
    }
  }
}
