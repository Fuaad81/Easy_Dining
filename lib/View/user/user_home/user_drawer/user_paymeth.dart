import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';

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
        title: const CustomText(text: "Payment Method", size: 21,weight: FontWeight.w500,),
        centerTitle: true,
      ),
      
    );
  }
}