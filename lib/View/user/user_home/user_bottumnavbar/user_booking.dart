import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:flutter/material.dart';

class user_Booking extends StatefulWidget {
   const user_Booking({super.key});

  @override
  State<user_Booking> createState() => _user_BookingState();
}

class _user_BookingState extends State<user_Booking> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: myColor.background,
      body: const Center(
        child: Text("booking"),
      ),
    );
  }
}