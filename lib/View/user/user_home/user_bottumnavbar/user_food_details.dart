import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/Providers/user_cart_provider.dart';
import 'package:easy_dine_in/Providers/user_favorite.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/service_model/adminModel/add/addfood_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class UserFoodDetails extends StatefulWidget {
  const UserFoodDetails({super.key});

  @override
  State<UserFoodDetails> createState() => _UserFoodDetailsState();
}

class _UserFoodDetailsState extends State<UserFoodDetails> {
  final TextEditingController _reviewController = TextEditingController();
  double? _rating;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final favoriteProvider = Provider.of<FavoritesProvider>(context);
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    FoodItem foodItem = FoodItem(
      foodName: data["foodname"],
      foodPrice: data["foodprize"],
      description: data["discription"],
      time: data["time"],
      category: data["category"],
      imageUrl: data["imageurl"],
    );
    bool isAdded =
        cartProvider.cartItems.any((item) => item.foodName == data["foodname"]);
    bool isFavorited = favoriteProvider.isFavorite(foodItem);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Food Details",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                data["imageurl"],
                height: 350.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: data["foodname"],
                      size: 20.spMin,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w, top: 5.h, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "₹${data["foodprize"]}",
                      size: 20.spMin,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text: "${data["time"]} min",
                      size: 17.spMin,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                child: CustomText(
                  text: data["discription"],
                  size: 18.spMin,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    // Navigate to user_paymethod with necessary details
                    //   },
                    //   style: ButtonStyle(
                    //     shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.r))),
                    //     backgroundColor:
                    //         WidgetStateProperty.all(myColor.maincolor),
                    //     foregroundColor:
                    //         WidgetStateProperty.all(myColor.background),
                    //     minimumSize: WidgetStateProperty.all(Size(150.w, 40.h)),
                    //   ),
                    //   child: CustomText(
                    //     text: "Buy Now",
                    //     size: 18.spMin,
                    //     weight: FontWeight.w500,
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        FoodItem foodItem = FoodItem(
                          foodName: data["foodname"],
                          foodPrice: data["foodprize"],
                          description: data["discription"],
                          time: data["time"],
                          category: data["category"],
                          imageUrl: data["imageurl"],
                        );
                        cartProvider.addToCart(foodItem);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("${data['foodname']} added to cart")),
                        );
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStateProperty.all(myColor.maincolor),
                        foregroundColor:
                            WidgetStateProperty.all(myColor.background),
                        minimumSize: WidgetStateProperty.all(Size(300.w, 40.h)),
                      ),
                      child: CustomText(
                        text: isAdded ? "Added" : "Add to Cart",
                        size: 18.spMin,
                        weight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (isFavorited) {
                          favoriteProvider.removeFromFavorites(foodItem);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${data['foodname']} removed from favorites")),
                          );
                        } else {
                          favoriteProvider.addToFavorites(foodItem);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${data['foodname']} added to favorites")),
                          );
                        }
                        setState(() {}); // Refresh the state to update the button text
                      },
                      child: Icon(
                        isFavorited ? IconlyBold.heart : IconlyLight.heart,
                        size: 30,
                        color: isFavorited ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "Add Your Review",
                        size: 20.spMin,
                        weight: FontWeight.bold),
                    TextField(
                      controller: _reviewController,
                      decoration: InputDecoration(
                          hintText: "Write your review here...",
                          filled: true,
                          fillColor: myColor.fieldbackground,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: myColor.textcolor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide:
                                  BorderSide(color: myColor.textcolor))),
                      maxLines: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, top: 5.h),
                      child: RatingBar.builder(
                        itemSize: 30,
                        glow: false,
                        itemCount: 5,
                        initialRating: 0,
                        allowHalfRating: true,
                        unratedColor: myColor.tabcolor,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        itemBuilder: (context, index) {
                          return Icon(
                            IconlyBold.star,
                            color: myColor.maincolor,
                            fill: 1.0,
                          );
                        },
                        onRatingUpdate: (value) {
                          setState(() {
                            _rating = value;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null && _reviewController.text.isNotEmpty) {
                          try {
                            DocumentSnapshot userSnapshot =
                                await FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(user.uid)
                                    .get();
                            String username = userSnapshot["name"];

                            await FirebaseFirestore.instance
                                .collection("foods")
                                .doc(data.id)
                                .collection("reviews")
                                .add({
                              "username": username,
                              "comment": _reviewController.text,
                              "rating": _rating,
                              "timestamp": FieldValue.serverTimestamp(),
                            });

                            _reviewController.clear();
                            setState(() {
                              _rating = 0.0;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Review added successfully!")),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Error adding review: $e")),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please add a review and rating")),
                          );
                        }
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor:
                            WidgetStateProperty.all(myColor.maincolor),
                        foregroundColor:
                            WidgetStateProperty.all(myColor.background),
                        minimumSize: WidgetStateProperty.all(Size(150.w, 40.h)),
                      ),
                      child: CustomText(
                        text: "Submit Review",
                        size: 18.spMin,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "Reviews",
                        size: 20.spMin,
                        weight: FontWeight.bold),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("foods")
                          .doc(data.id)
                          .collection("reviews")
                          .orderBy("timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return CustomText(
                            text: "No reviews yet. Be the first to review!",
                            size: 16.spMin,
                            color: Colors.grey,
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var review = snapshot.data!.docs[index];
                            return ListTile(
                              title: CustomText(
                                  text: review["username"], size: 18.spMin),
                              subtitle: CustomText(
                                  text: review["comment"], size: 16.spMin),
                              trailing: Icon(
                                IconlyBold.star,
                                color: Colors.amber,
                              ),
                              leading: CustomText(
                                text:
                                    "${review["rating"].toStringAsFixed(1)} ★",
                                size: 16.spMin,
                                color: Colors.amber,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
