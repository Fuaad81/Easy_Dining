import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  String _selectedPaymentMethod = "Cash on Delivery"; // Default value

  String get selectedPaymentMethod => _selectedPaymentMethod;

  void setPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }
}
