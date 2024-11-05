import 'package:easy_dine_in/Providers/user_favorite.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/service_model/adminModel/add/addfood_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart'; // Adjust this import

class user_Favorite extends StatefulWidget {
  const user_Favorite({super.key});

  @override
  State<user_Favorite> createState() => _user_FavoriteState();
}

class _user_FavoriteState extends State<user_Favorite> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoritesProvider>(context);
    final favoriteItems = favoriteProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Favorite", size: 21.spMin),
        centerTitle: true,
      ),
      body: favoriteItems.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 200.h,
              ),
              shrinkWrap: true,
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                FoodItem foodItem =
                    favoriteItems[index]; // Adjust according to your model
                return Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                  child: customCard(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 160.w,
                            height: 100.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                              child: Image.network(
                                foodItem
                                    .imageUrl, // Adjust according to your model
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w, top: 4.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: foodItem
                                    .foodName, // Adjust according to your model
                                size: 20.spMin,
                                weight: FontWeight.w600,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: InkWell(
                                  onTap: () {
                                    favoriteProvider
                                        .removeFromFavorites(foodItem);
                                  },
                                  child: Icon(
                                    IconlyBold.heart,
                                    size: 30,
                                    color: myColor.maincolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w, top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text:
                                    'Quantity: ${foodItem.quantity}', // Add quantity logic if needed
                                size: 16.spMin,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w, top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text:
                                    "₹${foodItem.foodPrice}", // Adjust according to your model
                                size: 20.spMin,
                                weight: FontWeight.w600,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: InkWell(
                                  onTap: () {
                                    // Add to cart logic
                                  },
                                  child: Image.asset(
                                    "assets/icons/ic_cart_outline.png",
                                    width: 30,
                                    color: myColor.textcolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CustomText(text: "No favorites yet.", size: 18.spMin)),
    );
  }
}
