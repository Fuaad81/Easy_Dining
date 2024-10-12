import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/Providers/user_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class user_Table_Details extends StatefulWidget {
  const user_Table_Details({super.key});

  @override
  State<user_Table_Details> createState() => _user_Table_DetailsState();
}

class _user_Table_DetailsState extends State<user_Table_Details> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Start the fade animation after the widget is built
      Provider.of<fadeAnimationProvider>(context, listen: false)
          .startFadeAnimation();
    });
  }

  void details() {
    showModalBottomSheet(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      isScrollControlled: true,
      backgroundColor: myColor.background,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: _controller,
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.6,
          minChildSize: 0.25,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: myColor.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r))),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Book your table",
                              size: 18.spMin,
                              weight: FontWeight.w500,
                              color: myColor.textcolor.withOpacity(0.5),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconlyLight.heart,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                      CustomText(
                        text: "Table No",
                        size: 24.spMin,
                        weight: FontWeight.w500,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CustomText(
                          text: "₹150",
                          size: 20.spMin,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160.w,
                              child: CustomTextFormField(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.r)),
                                filled: true,
                                fillColor: myColor.fieldbackground,
                                hintText: "Date",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.calendar,
                                      color: myColor.maincolor,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 160.w,
                              child: CustomTextFormField(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.r)),
                                filled: true,
                                fillColor: myColor.fieldbackground,
                                hintText: "Type",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.arrow_down_2,
                                      color: myColor.maincolor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160.w,
                              child: CustomTextFormField(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.r)),
                                filled: true,
                                fillColor: myColor.fieldbackground,
                                hintText: "Time",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.time_circle,
                                      color: myColor.maincolor,
                                    )),
                              ),
                            ),
                            CustomText(
                              text: "to",
                              size: 18.spMin,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: 160.w,
                              child: CustomTextFormField(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.r)),
                                filled: true,
                                fillColor: myColor.fieldbackground,
                                hintText: "Time",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.time_circle,
                                      color: myColor.maincolor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          children: [
                            CustomText(
                              text: "Number of Seats : ",
                              size: 22.spMin,
                              weight: FontWeight.w500,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.plus_square_fill,
                                        color: myColor.maincolor,
                                        size: 30,
                                      )),
                                  CustomText(text: "1", size: 22.spMin),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.minus_square_fill,
                                        color: myColor.maincolor,
                                        size: 30,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Occation",
                            size: 22.spMin,
                            weight: FontWeight.w500,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: SizedBox(
                              width: 200.w,
                              child: CustomTextFormField(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.r)),
                                filled: true,
                                fillColor: myColor.fieldbackground,
                                hintText: "occation..",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        myColor.tabcolor),
                                    foregroundColor: WidgetStatePropertyAll(
                                        myColor.background),
                                    minimumSize: const WidgetStatePropertyAll(
                                        Size(150, 45)),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r)))),
                                onPressed: () {},
                                child:
                                    CustomText(text: "Cancel", size: 20.spMin)),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        myColor.maincolor),
                                    foregroundColor: WidgetStatePropertyAll(
                                        myColor.background),
                                    minimumSize: const WidgetStatePropertyAll(
                                        Size(150, 45)),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r)))),
                                onPressed: () {},
                                child: CustomText(
                                    text: "Book Now", size: 20.spMin))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  final _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Table Details",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/ic_notification.png",
                width: 30,
              ))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              data["imageUrl"],
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 380.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                      color: myColor.background,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Book your table",
                                  size: 18.spMin,
                                  weight: FontWeight.w500,
                                  color: myColor.textcolor.withOpacity(0.5),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      IconlyLight.heart,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                          CustomText(
                            text: "Table No : ${data["table_no"]}",
                            size: 24.spMin,
                            weight: FontWeight.w500,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: CustomText(
                              text: "₹${data["prize"]}",
                              size: 20.spMin,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ElevatedButton(
                              //     onPressed: () => details(),
                              //     style: ButtonStyle(
                              //         backgroundColor:
                              //             WidgetStatePropertyAll(myColor.background),
                              //         foregroundColor:
                              //             WidgetStatePropertyAll(myColor.maincolor),
                              //         minimumSize:
                              //             WidgetStatePropertyAll(Size(160.w, 40.h))),
                              //     child: CustomText(text: "View Details", size: 20.spMin)),
                              Consumer<fadeAnimationProvider>(builder:
                                  (context, fadeanimationProvider, child) {
                                return TextButton(
                                    onPressed: () => details(),
                                    child: AnimatedOpacity(
                                      opacity: fadeanimationProvider.opacity,
                                      duration: const Duration(seconds: 1),
                                      child: CustomText(
                                        text: "Click here for booking",
                                        size: 21.spMin,
                                        color: myColor.maincolor,
                                        weight: FontWeight.w500,
                                      ),
                                    ));
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
