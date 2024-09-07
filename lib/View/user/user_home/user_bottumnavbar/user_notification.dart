import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class user_notification extends StatefulWidget {
  const user_notification({super.key});

  @override
  State<user_notification> createState() => _user_notificationState();
}

class _user_notificationState extends State<user_notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.background,
      appBar: AppBar(
        backgroundColor: myColor.background,
        centerTitle: true,
        title: const CustomText(
          text: "Notification",
          size: 21,
          weight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
            child: ListTile(
              tileColor: myColor.notification,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              title: const Padding(
                padding: EdgeInsets.only(top:10),
                child: CustomText(text: "⏳Limited-Time Deal", size: 20,weight: FontWeight.w500,),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(text: "hurry! enjoy 20% off salad items in this weakend.", size: 18,),
              ),
            ),
          );
        },
      ),
    );
  }
}
// Container(
//               width: 300.w,
//               height: 130.h,
//               decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                         color: myColor.textcolor.withOpacity(0.5),
//                         blurRadius: 4,
//                         offset: const Offset(0, 4))
//                   ],
//                   color: myColor.notification,
//                   borderRadius: BorderRadius.all(Radius.circular(10.r))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 15.w, top: 20.h),
//                     child: CustomText(
//                       text: "⏳Limited-Time Deal",
//                       size: 18,
//                       weight: FontWeight.w500,
//                       textStyle: const TextStyle(),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: 15.w,
//                         top: 10.h,
//                       ),
//                       child: CustomText(
//                         text:
//                             "hurry! enjoy 20% off salad items in this weakend ",
//                         size: 16,
//                         textStyle: const TextStyle(),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),