import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class admin_db_Accepted extends StatefulWidget {
  const admin_db_Accepted({super.key});

  @override
  State<admin_db_Accepted> createState() => _admin_db_AcceptedState();
}

class _admin_db_AcceptedState extends State<admin_db_Accepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("approveddboy").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return Center(
                child: Text("No data available"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/admin_dbacptdet",
                          arguments: {"data": data});
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      tileColor: myColor.tabcolor,
                      leading: const CircleAvatar(
                        radius: 30,
                        child: Icon(IconlyBold.profile),
                      ),
                      title: CustomText(text: data["name"], size: 18.spMin),
                      subtitle: CustomText(text: data["email"], size: 14.spMin),
                      trailing: const Icon(IconlyLight.arrow_right_2),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
