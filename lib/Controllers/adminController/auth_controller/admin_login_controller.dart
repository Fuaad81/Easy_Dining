import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String _adminEmail = "admin22@gmail.com";
  final String _adminPassword = "admin@12";

  Future<void> adminLogin(
      BuildContext context, String email, String password) async {
    if (email == _adminEmail && password == _adminPassword) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: _adminEmail, password: _adminPassword);
        Navigator.pushNamed(context, "/admin_bottombar");
        
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: CustomText(text: "Login success", size: 18.spMin)));
        return;
      } catch (e) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content:
        //         CustomText(text: "Error : ${e.toString()}", size: 18.spMin)));
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                CustomText(text: "Error : ${'invalid credentials'}", size: 18.spMin)));
      }
    }
  }
}

