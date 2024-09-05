import 'package:easy_dine_in/Providers/admin_provider.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_home.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class admin_Bottombar extends StatefulWidget {
  const admin_Bottombar({super.key});

  @override
  State<admin_Bottombar> createState() => _admin_BottombarState();
}

class _admin_BottombarState extends State<admin_Bottombar> {
  @override
  Widget build(BuildContext context) {
    final adminnavProvider = Provider.of<AdminNavbarProvider>(context);
    List<dynamic> homePages = [
      const admin_home(),
      const admin_home(),
      const admin_home(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: adminnavProvider.currentIndex == 0
                ? Icon(
                    IconlyBold.home,
                    color: myColor.maincolor,
                  )
                : Icon(
                    IconlyLight.home,
                    color: myColor.tabcolor,
                  ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: adminnavProvider.currentIndex == 1
                  ? Icon(
                      IconlyBold.document,
                      color: myColor.maincolor,
                    )
                  : Icon(IconlyLight.document,color: myColor.tabcolor,),
              label: "History"),
          BottomNavigationBarItem(
              icon: adminnavProvider.currentIndex == 2
                  ? Icon(
                      IconlyBold.profile,
                      color: myColor.maincolor,
                    )
                  : Icon(IconlyLight.profile,color: myColor.tabcolor,),
              label: "Profile"),
        ],
        currentIndex: adminnavProvider.currentIndex,
        onTap: adminnavProvider.adminIndex,
        backgroundColor: myColor.background,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: myColor.textcolor,
        showUnselectedLabels: false,
      ),
      body: homePages.elementAt(adminnavProvider.currentIndex),
    );
  }
}
