import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
   Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("booking"),
      ),
    );
  }
}