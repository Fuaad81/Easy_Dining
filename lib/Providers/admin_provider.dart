import 'package:flutter/material.dart';

//Admin bottom navigation bar provider
class AdminNavbarProvider extends ChangeNotifier{
  int _currentindex = 0;

  int get currentIndex => _currentindex;

  void adminIndex(index){
    _currentindex = index;
    notifyListeners();
  }
}