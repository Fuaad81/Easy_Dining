import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/service_model/user_register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User_RegisterController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(user_Register_Model userreg, BuildContext context) async {
    try {
      if (!userreg.terms!) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: CustomText(
                text: "You must accept the terms & condition",
                size: 18.spMin)));
        return;
      }
      if (userreg.password != userreg.confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                CustomText(text: "Password do not match", size: 18.spMin)));
        return;
      }
      //firebase authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userreg.email!, password: userreg.password!);

      //save data to firebase 
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "name" : userreg.name,
        "email" : userreg.email,
        "number" : userreg.number,
        "password" : userreg.password,
        "confirmpassword" : userreg.confirmPassword,
        "terms" : userreg.terms,
        "uid": userCredential.user!.uid
      });
      Navigator.pushNamed(context, "/user_createsuccess");
      
      

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Registration success", size: 18.spMin))
        );
        return;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(text: "Error : ${e.toString()}", size: 18.spMin))
        );
        return;
        
    }
  }
}
