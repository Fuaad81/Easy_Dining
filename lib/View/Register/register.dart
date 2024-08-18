import 'package:easy_dine_in/model/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Image.network(
                  "https://img.freepik.com/premium-vector/sign-up-vector-illustration-flat-2_764382-77019.jpg?ga=GA1.2.858342164.1723694889&semt=ais_hybrid",
                  width: ScreenUtil().setWidth(250),
                  height: ScreenUtil().setHeight(250),
                ),
              ),
            ),
            
          ],
        ),
      )),
    );
  }
}
