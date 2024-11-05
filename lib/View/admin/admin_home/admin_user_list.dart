import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class admin_User_List extends StatefulWidget {
  const admin_User_List({super.key});

  @override
  State<admin_User_List> createState() => _admin_User_ListState();
}

class _admin_User_ListState extends State<admin_User_List> {
  // final List <Color> colors= [
  //   Colors.red.shade200,
  //   Colors.blue.shade200,
  //   Colors.grey.shade200,
  //   Colors.green.shade200,
  //   Colors.yellow.shade200,
  //   Colors.teal.shade200,
  //   Colors.red.shade200,
  //   Colors.deepPurple.shade200,
  // ];
  // Color _getRandomColor() {
  //   final random = Random();
  //   return colors[random.nextInt(colors.length)];
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:CustomText(text:"User List",size:21.spMin,weight: FontWeight.w500,),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
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
                text: "No users found",
                size: 18.spMin,
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshots.data!.docs[index];
            return Padding(
              padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/admin_userdetails",arguments: {"data": data});
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(data["imageUrl"]),
                ),
                title:   CustomText(text: data["name"], size: 18.spMin,weight: FontWeight.w500,),
                subtitle:   CustomText(text: data["email"], size: 14.spMin,weight: FontWeight.w400,),
                tileColor: myColor.fieldbackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
                ),
                
                // trailing: const Icon(IconlyLight.arrow_right_2,size: 30,),
              ),
            );
          },);
        }
      ),
    );
  }
}