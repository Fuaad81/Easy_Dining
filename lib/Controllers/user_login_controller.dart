import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/service_model/user_login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User_LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> loginUser(
      User_Login_Model loginmodel, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: loginmodel.email!, password: loginmodel.password!);
      Navigator.pushNamed(context, "/user_bottomnav");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(text: "Registration success", size: 18.spMin)));
      return;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Error : ${e.toString()}", size: 18.spMin))
        );
    }
  }
}
