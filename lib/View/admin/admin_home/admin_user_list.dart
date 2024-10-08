import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_User_List extends StatefulWidget {
  const admin_User_List({super.key});

  @override
  State<admin_User_List> createState() => _admin_User_ListState();
}

class _admin_User_ListState extends State<admin_User_List> {
  // final List <Color> colors= [
  //   Colors.red,
  //   Colors.blue,
  //   Colors.grey,
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.teal,
  //   Colors.red,
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:CustomText(text:"User List",size:21.spMin)
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          return ListView.builder(
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshots.data!.docs[index];
            return Padding(
              padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(data["name"][0]),
                  radius: 30,
                  backgroundColor: myColor.background,
                ),
                title:   CustomText(text: data["name"], size: 18.spMin,weight: FontWeight.w500,),
                subtitle:   CustomText(text: data["email"], size: 14.spMin,weight: FontWeight.w400,),
                tileColor: myColor.fieldbackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
                ),
                trailing: IconButton(onPressed: (){}, icon: const Icon(IconlyLight.arrow_right_2,size: 30,)),
              ),
            );
          },);
        }
      ),
    );
  }
}