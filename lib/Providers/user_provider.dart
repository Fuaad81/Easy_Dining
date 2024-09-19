import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  bool _checked = true;

  bool get checked => _checked;

  void checking() {
    _checked = !_checked;
    notifyListeners();
  }
}

class fadeAnimationProvider extends ChangeNotifier {
  double _opacity = 1.0;

  double get opacity => _opacity;

  void toggleOpacity() {
    _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    notifyListeners();
  }

  void startFadeAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      toggleOpacity();
      startFadeAnimation();
    });
  }
}
