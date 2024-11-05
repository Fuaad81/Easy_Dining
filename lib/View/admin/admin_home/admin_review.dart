import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_Review extends StatefulWidget {
  const admin_Review({super.key});

  @override
  State<admin_Review> createState() => _admin_ReviewState();
}

class _admin_ReviewState extends State<admin_Review> {
  final TextEditingController reviewcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title:   CustomText(
          text: "Review",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("feedback").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshots.hasError) {
            return Center(
              child: CustomText(
                text: "Error: ${snapshots.error}",
                size: 16.spMin,
                color: myColor.errortext,
              ),
            );
          }
           else if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
            return Center(
              child: CustomText(
                text: "No feedback found",
                size: 18.spMin,
              ),
            );
          }

          return ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              
            );
          },);
        }
      ),
          
    );
  }
}
