import 'package:easy_dine_in/model/service_model/adminModel/add/addfood_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  final List<FoodItem> _cartItems = [];

  List<FoodItem> get cartItems => _cartItems;

  // add item to cart
  void addToCart(FoodItem foodItem) {
    // Check if item already exists in the cart
    var existingItem = _cartItems.firstWhere(
      (item) => item.id == foodItem.id,
      orElse: () => FoodItem(
          foodName: "",
          foodPrice: '',
          description: '',
          time: '',
          category: '',
          imageUrl: ''), // Dummy item
    );

    if (existingItem.id != '') {
      // If item exists, increment quantity
      incrementQuantity(foodItem.id);
    } else {
      _cartItems.add(foodItem);
      notifyListeners();
    }
  }
  double get subtotal {
    double total = 0.0;
    for (var item in _cartItems) {
      total += double.parse(item.foodPrice) * item.quantity;
    }
    return total;
  }

  // Remove item from cart
  void removeFromCart(FoodItem fooditem) {
    _cartItems.remove(fooditem);
    notifyListeners();
  }

  void incrementQuantity(String foodItemId) {
    final index = _cartItems.indexWhere((item) => item.id == foodItemId);
    if (index != -1) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String foodItemId) {
    final index = _cartItems.indexWhere((item) => item.id == foodItemId);
    if (index != -1 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  // clear all items from cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // get total items count
  int get cartItemsCount => _cartItems.length;
}
