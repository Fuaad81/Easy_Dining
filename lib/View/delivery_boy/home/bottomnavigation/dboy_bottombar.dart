import 'package:easy_dine_in/View/delivery_boy/home/bottomnavigation/dboy_history.dart';
import 'package:easy_dine_in/View/delivery_boy/home/bottomnavigation/dboy_profile.dart';
import 'package:easy_dine_in/View/delivery_boy/home/dboy_home.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class dboy_Bottom_Bar extends StatefulWidget {
  const dboy_Bottom_Bar({super.key});

  @override
  State<dboy_Bottom_Bar> createState() => _dboy_Bottom_BarState();
}

class _dboy_Bottom_BarState extends State<dboy_Bottom_Bar> {
  var _currentIndex = 0;
  List<dynamic> pages = [
    const dboy_Home(),
    const dboy_History(),
    const dboy_Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() { 
          _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(IconlyLight.profile), label: "Profile")
        ],
        selectedItemColor: myColor.maincolor,
        unselectedItemColor: myColor.textcolor,
        showUnselectedLabels: true,
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}
