import 'package:easy_dine_in/model/service_model/adminModel/add/addfood_model.dart';
import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<FoodItem> _favorites = [];

  List<FoodItem> get favorites => _favorites;

  void addToFavorites(FoodItem item) {
    if (!_favorites.any((fav) => fav.foodName == item.foodName)) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removeFromFavorites(FoodItem item) {
    _favorites.removeWhere((fav) => fav.foodName == item.foodName);
    notifyListeners();
  }

  bool isFavorite(FoodItem item) {
    return _favorites.any((fav) => fav.foodName == item.foodName);
  }
}
