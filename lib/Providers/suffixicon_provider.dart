import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  bool _checked = true;

  bool get checked => _checked;

  void checking(){
    _checked =! _checked;
    notifyListeners();
  }
}