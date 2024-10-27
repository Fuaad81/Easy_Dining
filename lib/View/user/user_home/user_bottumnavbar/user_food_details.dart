import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/Providers/user_cart_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/service_model/adminModel/add/addfood_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class UserFoodDetails extends StatefulWidget {
  const UserFoodDetails({super.key});

  @override
  State<UserFoodDetails> createState() => _UserFoodDetailsState();
}

class _UserFoodDetailsState extends State<UserFoodDetails> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    bool isAdded =
        cartProvider.cartItems.any((item) => item.foodName == data["foodname"]);

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
              SizedBox(
                width: 340.w,
                child: customCard(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r)),
                          child: Image.network(
                            data["imageurl"],
                            height: 350.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
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
                            InkWell(
                                onTap: () {},
                                child: const Icon(
                                  IconlyLight.heart,
                                  size: 30,
                                )),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(user!.uid)
                              .get();

                          if (documentSnapshot.exists) {
                            List details = [
                              {
                                "name": documentSnapshot["name"],
                                "number": documentSnapshot["number"],
                                "email": documentSnapshot["email"],
                                "location": documentSnapshot["address"],
                                "time": data["time"],
                                "description": data["discription"],
                                "image": data["image"],
                                "id": data["id"],
                              }
                            ];

                            Navigator.pushNamed(context, "/user_paymethod", arguments: [details]);
                          } else {
                            // Handle user not found scenario
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("User details not found.")),
                            );
                          }
                        } catch (e) {
                          // Handle any errors from Firestore
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error fetching user details: $e")),
                          );
                        }
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor: WidgetStateProperty.all(myColor.maincolor),
                        foregroundColor: WidgetStateProperty.all(myColor.background),
                        minimumSize: WidgetStateProperty.all(Size(150.w, 40.h)),
                      ),
                      child: CustomText(
                        text: "Buy Now",
                        size: 18.spMin,
                        weight: FontWeight.w500,
                      ),
                    ),
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
                          SnackBar(content: Text("${data['foodname']} added to cart")),
                        );
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                        backgroundColor: WidgetStateProperty.all(myColor.tabcolor),
                        foregroundColor: WidgetStateProperty.all(myColor.background),
                        minimumSize: WidgetStateProperty.all(Size(150.w, 40.h)),
                      ),
                      child: CustomText(
                        text: isAdded ? "Added" : "Add to Cart",
                        size: 18.spMin,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
