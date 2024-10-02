import 'package:easy_dine_in/Providers/admin_provider.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_history.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_home.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_order_list.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_profile.dart';
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
      const admin_Order_List(),
      const admin_History(),
      const admin_Profile(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.home,
              color: adminnavProvider.currentIndex == 0
                  ? myColor.maincolor
                  : myColor.tabcolor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.document,
              color: adminnavProvider.currentIndex == 1
                  ? myColor.maincolor
                  : myColor.tabcolor,
            ),
            label: "Order List",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: adminnavProvider.currentIndex == 2
                    ? myColor.maincolor
                    : myColor.tabcolor,
              ),
              label: "History"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.profile,
                color: adminnavProvider.currentIndex == 3
                    ? myColor.maincolor
                    : myColor.tabcolor,
              ),
              label: "Profile"),
        ],
        currentIndex: adminnavProvider.currentIndex,
        onTap: adminnavProvider.adminIndex,
        
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
