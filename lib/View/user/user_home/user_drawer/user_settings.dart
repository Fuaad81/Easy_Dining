// ignore_for_file: prefer__ructors

import 'package:easy_dine_in/Providers/theme_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class user_accountSetting extends StatefulWidget {
  const user_accountSetting({super.key});

  @override
  State<user_accountSetting> createState() => _user_accountSettingState();
}

class _user_accountSettingState extends State<user_accountSetting> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Account Settings",
          size: 24.spMin,
          weight: FontWeight.w400,
          textStyle: const TextStyle(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 15.h),
              child: CustomText(
                text: "Account",
                size: 22.spMin,
                weight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
                ),
                tileColor: myColor.tabcolor.withOpacity(0.6),
                leading: CircleAvatar(
                  radius: 25.r,
                ),
                title: CustomText(
                  text: "Name",
                  size: 22.spMin,
                  weight: FontWeight.w500,
                  textStyle: const TextStyle(),
                ),
                subtitle: CustomText(
                  text: "sample@gmail.com",
                  size: 20.spMin,
                  weight: FontWeight.w300,
                  textStyle: const TextStyle(),
                ),
              ),
            ),
            // const Divider(),
            Padding(
              padding: EdgeInsets.only(left: 10.w,top: 15.h),
              child: CustomText(
                text: "Other Settings",
                size: 22.spMin,
                weight: FontWeight.w500,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/user_editprofile");
              },
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: myColor.linktext.withOpacity(0.2),
                child: Image.asset(
                  "assets/icons/ic_edit_profile.png",
                  width: 30,
                ),
              ),
              title: CustomText(
                text: "Edit Profile",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/user_forgot");
              },
              leading: CircleAvatar(
                backgroundColor: myColor.tabcolor.withOpacity(0.4),
                radius: 20.r,
                child: Image.asset(
                  "assets/icons/ic_change_password.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "Change Password",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/user_paymethod");
              },
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: myColor.bluecolor.withOpacity(0.2),
                child: Image.asset(
                  "assets/icons/ic_payment.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "Payment Method",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              onTap: () {
                // Navigator.pushNamed(context, "/user_theme");
              },
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: myColor.tabcolor.withOpacity(0.4),
                child: Image.asset(
                  "assets/icons/ic_theme.png",
                  width: 30,
                ),
              ),
              title: CustomText(
                text: "Theme",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: IconButton(
                  onPressed: () {
                    theme.toggleTheme();
                  },
                  icon: theme.isDarkMode == false
                      ? const Icon(CupertinoIcons.moon_fill)
                      : const Icon(CupertinoIcons.sun_max_fill)),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/user_about");
              },
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: myColor.bluecolor.withOpacity(0.2),
                child: Image.asset(
                  "assets/icons/ic_about.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "About",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: myColor.tabcolor.withOpacity(0.4),
                child: Image.asset(
                  "assets/icons/ic_terms.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "Terms & Condition",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: myColor.bluecolor.withOpacity(0.2),
                radius: 20.r,
                child: Image.asset(
                  "assets/icons/ic_invite_friends.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "Invite Friends",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: myColor.bluecolor.withOpacity(0.2),
                radius: 20.r,
                child: Image.asset(
                  "assets/icons/ic_logout.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "Log Out",
                size: 20.spMin,
                weight: FontWeight.w400,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: myColor.errortext.withOpacity(0.2),
                child: Image.asset(
                  "assets/icons/ic_delete.png",
                  width: 25,
                ),
              ),
              title: CustomText(
                text: "Delete Account",
                size: 20.spMin,
                weight: FontWeight.w400,
                color: myColor.errortext,
              ),
              trailing: const Icon(IconlyLight.arrow_right_2),
            ),
          ],
        ),
      ),
    );
  }
}
