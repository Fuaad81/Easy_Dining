import 'package:easy_dine_in/Providers/user_cart_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class user_Cart extends StatefulWidget {
  const user_Cart({super.key});

  @override
  State<user_Cart> createState() => _user_CartState();
}

class _user_CartState extends State<user_Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Cart",
            size: 21.spMin,
            weight: FontWeight.w600,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Image.asset(
                "assets/icons/ic_notification.png",
                width: 25.w,
              ),
            )
          ],
        ),
        body: cartProvider.cartItems.isEmpty
            ? Center(
                child: CustomText(text: "No cart Item", size: 20.spMin),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartProvider.cartItems[index];
                        return Dismissible(
                          key: Key(cartItem.id.toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                              color: myColor.errortext,
                              child: Icon(IconlyLight.delete)),
                          onDismissed: (direction) {
                            // Remove the item from the cart
                            cartProvider.removeFromCart(cartItem);
                            // Optionally, show a snackbar to undo the action
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${cartItem.foodName} removed from cart'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Add the item back to the cart if the user taps undo
                                    cartProvider.addToCart(cartItem);
                                  },
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, right: 10.w, left: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: customCard(
                                      color: myColor.background,
                                      elevation: 6,
                                      child: SizedBox(
                                        width: 320.w,
                                        height: 100.h,
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.r),
                                                  bottomLeft:
                                                      Radius.circular(10.r)),
                                              child: Image.network(
                                                cartItem.imageUrl,
                                                width: 120.w,
                                                height: 100.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CustomText(
                                                    text: cartItem.foodName,
                                                    size: 20.spMin,
                                                    weight: FontWeight.w400,
                                                  ),
                                                  // CustomText(
                                                  //   text: cartItem.category,
                                                  //   size: 20.spMin,
                                                  //   weight: FontWeight.w400,
                                                  // ),
                                                  CustomText(
                                                    text:
                                                        "₹${cartItem.foodPrice}",
                                                    size: 18.spMin,
                                                    weight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30.w),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        cartProvider
                                                            .decrementQuantity(
                                                                cartItem.id);
                                                      },
                                                      child: Icon(
                                                          CupertinoIcons
                                                              .minus_square_fill,
                                                          size: 30,
                                                          color: cartItem
                                                                      .quantity <=
                                                                  1
                                                              ? myColor.tabcolor
                                                              : myColor
                                                                  .maincolor)),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: CustomText(
                                                        text: cartItem.quantity
                                                            .toString(),
                                                        size: 20.spMin),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: InkWell(
                                                        onTap: () {
                                                          cartProvider
                                                              .incrementQuantity(
                                                                  cartItem.id);
                                                        },
                                                        child: Icon(
                                                          IconlyBold.plus,
                                                          size: 30,
                                                          color:
                                                              myColor.maincolor,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // body: Column(
                  //   children: [
                  //     Expanded(
                  //       child: ListView.builder(
                  //         itemCount: 2,
                  //         itemBuilder: (context, index) {
                  //           return Padding(
                  //             padding: EdgeInsets.only(top: 10.h,right: 10.w,left: 10.w),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Expanded(
                  //                   child: customCard(
                  //                       color: myColor.background,
                  //                       elevation: 6,
                  //                       child: SizedBox(
                  //                         width: 320.w,
                  //                         height: 100.h,
                  //                         child: Row(
                  //                           children: [
                  //                             ClipRRect(
                  //                               borderRadius: BorderRadius.only(
                  //                                   topLeft: Radius.circular(10.r),
                  //                                   bottomLeft: Radius.circular(10.r)),
                  //                               child: Image.asset(
                  //                                 "assets/images/image.png",
                  //                                 width: 120.w,
                  //                                 height: 100.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                             ),
                  //                             Padding(
                  //                               padding: EdgeInsets.only(left: 10.w),
                  //                               child: Column(
                  //                                 mainAxisSize: MainAxisSize.min,
                  //                                 crossAxisAlignment:
                  //                                     CrossAxisAlignment.start,
                  //                                 mainAxisAlignment:
                  //                                     MainAxisAlignment.spaceEvenly,
                  //                                 children: [
                  //                                    CustomText(
                  //                                     text: "Name",
                  //                                     size: 20.spMin,
                  //                                     weight: FontWeight.w500,
                  //                                   ),
                  //                                   CustomText(
                  //                                     text: "catagory",
                  //                                     size: 20.spMin,
                  //                                     weight: FontWeight.w400,
                  //                                   ),
                  //                                   Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment.start,
                  //                                     children: [
                  //                                       InkWell(
                  //                                           onTap: () {},
                  //                                           child: Icon(
                  //                                             CupertinoIcons
                  //                                                 .minus_square_fill,
                  //                                             color: myColor.maincolor,
                  //                                           )),
                  //                                       Padding(
                  //                                         padding: EdgeInsets.only(
                  //                                             left: 5.w),
                  //                                         child: CustomText(
                  //                                             text: "1", size: 18.spMin),
                  //                                       ),
                  //                                       Padding(
                  //                                         padding: EdgeInsets.only(
                  //                                             left: 5.w),
                  //                                         child: InkWell(
                  //                                             onTap: () {},
                  //                                             child: Icon(
                  //                                               IconlyBold.plus,
                  //                                               color:
                  //                                                   myColor.maincolor,
                  //                                             )),
                  //                                       ),
                  //                                       Padding(
                  //                                         padding: EdgeInsets.only(
                  //                                             left: 40.w),
                  //                                         child: CustomText(
                  //                                           text: "₹15",
                  //                                           size: 16.spMin,
                  //                                           weight: FontWeight.w500,
                  //                                         ),
                  //                                       )
                  //                                     ],
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       )),
                  //                 ),
                  //               ],
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ),

                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: 2,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 10.h),
                  //         child: ListTile(
                  //           tileColor: myColor.tabcolor,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10.r)
                  //           ),
                  //           contentPadding: const EdgeInsets.all(0),
                  //           leading: ClipRRect(
                  //             borderRadius: BorderRadius.circular(10.r),
                  //             child: Image.asset("assets/images/image.png",fit: BoxFit.cover,)),
                  //           title: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               CustomText(
                  //                 text: "Name",
                  //                 size: 22.spMin,
                  //                 weight: FontWeight.w500,
                  //               ),
                  //               CustomText(
                  //                 text: "catagory",
                  //                 size: 22.spMin,
                  //                 weight: FontWeight.w400,
                  //               ),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 children: [
                  //                   InkWell(
                  //                       onTap: () {},
                  //                       child: Icon(
                  //                         CupertinoIcons.minus_square_fill,
                  //                         color: myColor.maincolor,
                  //                       )),
                  //                   Padding(
                  //                     padding: EdgeInsets.only(left: 5.w),
                  //                     child: CustomText(text: "1", size: 18.spMin),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.only(left: 5.w),
                  //                     child: InkWell(
                  //                         onTap: () {},
                  //                         child: Icon(
                  //                           IconlyBold.plus,
                  //                           color: myColor.maincolor,
                  //                         )),
                  //                   ),
                  //                   // Padding(
                  //                   //   padding: EdgeInsets.only(left: 40.w),
                  //                   //   child: CustomText(
                  //                   //     text: "₹15",
                  //                   //     size: 16.spMin,
                  //                   //     weight: FontWeight.w500,
                  //                   //   ),
                  //                   // )
                  //                 ],
                  //               ),
                  //             ],
                  //           ),

                  //           trailing: Padding(
                  //             padding:  EdgeInsets.only(right: 80.w),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.end,
                  //               children: [
                  //                 CustomText(
                  //                             text: "₹15",
                  //                             size: 18.spMin,
                  //                             weight: FontWeight.w800,
                  //                           ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Container(
                      width: 340.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: myColor.tabcolor.withOpacity(0.6),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: CustomText(
                                      text: "Subtotal",
                                      size: 20.spMin,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: CustomText(
                                      text: "₹${cartProvider.subtotal.toStringAsFixed(2)}",
                                      size: 20.spMin,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: CustomText(
                                      text: "Delivery",
                                      size: 20.spMin,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: CustomText(
                                      text: "₹1.84",
                                      size: 20.spMin,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: CustomText(
                                      text: "Total",
                                      size: 20.spMin,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: CustomText(
                                      text: "₹${(cartProvider.subtotal + 1.84).toStringAsFixed(2)}",
                                      size: 20.spMin,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/user_checkout");
                        },
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all(myColor.maincolor),
                          foregroundColor:
                              WidgetStateProperty.all(myColor.background),
                          minimumSize:
                              WidgetStateProperty.all(Size(340.w, 45.h)),
                        ),
                        child: CustomText(
                          text: "Check Out",
                          size: 20.spMin,
                          color: myColor.background,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(),
                        )),
                  )
                ],
              ));
  }
}
