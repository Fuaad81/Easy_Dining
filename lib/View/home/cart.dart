import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
   Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("cart"),
      ),
    );
  }
}