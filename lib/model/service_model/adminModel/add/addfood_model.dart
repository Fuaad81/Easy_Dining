import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItem {
  String id;
  final String foodName;
  final String foodPrice;
  final String description;
  final String time;
  final String category;
  final String imageUrl;
  int quantity;

  FoodItem({
    this.id = '',
    required this.foodName,
    required this.foodPrice,
    required this.description,
    required this.time,
    required this.category,
    required this.imageUrl,
    this.quantity = 1
  });

  // Factory constructor to create a FoodItem instance from Firestore document data
  factory FoodItem.fromMap(dynamic source) {
    Map<String, dynamic> data;
    String id;

    if (source is DocumentSnapshot) {
      data = source.data() as Map<String, dynamic>;
      id = source.id;
    } else if (source is Map<String, dynamic>) {
      data = source;
      id = data['id'] ?? '';
    } else {
      throw ArgumentError('Invalid source type for FoodItem.fromMap');
    }

    return FoodItem(
      id: id,
      foodName: data['foodname'] ?? '',
      foodPrice: data['foodprize'] ?? '',
      description: data['description'] ?? '',
      time: data['time'] ?? '',
      category: data['category'] ?? '',
      imageUrl: data['imageurl'] ?? '',
      quantity: data["quantity"] ?? ''
    );
  }

  // Method to convert a FoodItem instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'foodname': foodName,
      'foodprize': foodPrice,
      'discription': description,
      'time': time,
      'category': category,
      'imageurl': imageUrl,
      'quantity' : quantity
    };
  }
}
