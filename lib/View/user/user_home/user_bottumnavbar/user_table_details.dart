import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/Providers/user_provider.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';
import 'package:easy_dine_in/model/Utils/widget/cutomtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
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

  String? selectedType;
  final List<String> type = ["AC", "Non-AC"];
  DateTime? selectedDate;
  TimeOfDay? selectedFromTime;
  TimeOfDay? selectedToTime;
  int numberOfSeats = 1;
  final TextEditingController _occationontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void timePicker(bool isFromTime) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime != null) {
        setState(() {
          if (isFromTime) {
            selectedFromTime = pickedTime;
          } else {
            selectedToTime = pickedTime;
          }
        });
      }
    });
  }

  void datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    });
  }

  void incrementSeats() {
    setState(() {
      numberOfSeats++;
    });
  }

  void decrementSeats() {
    if (numberOfSeats > 1) {
      setState(() {
        numberOfSeats--;
      });
    }
  }

  final _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    DocumentSnapshot data = args['data'];
    FirebaseAuth auth = FirebaseAuth.instance;
    Future<void> adddata() async {
      User?user = auth.currentUser;
      // QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("Users").get();
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("Users").doc(user?.uid).get();
      try {
        if (formkey.currentState!.validate()) {
          await FirebaseFirestore.instance.collection("bookTable").add({
            "name": snapshot["name"],
            "email": snapshot["email"],
            "profileImage" : snapshot["imageUrl"],
            "location": snapshot["address"],
            'table no': data["table_no"],
            "table prize": data["prize"],
            "table image": data["imageUrl"],
            
            "date": selectedDate != null
                ? DateFormat('dd-MM-yyyy').format(selectedDate!)
                : 'select date',
            "category": selectedType.toString(),
            "frometime": selectedFromTime != null
                ? selectedFromTime!.format(context)
                : "From Time",
            "totime": selectedToTime != null
                ? selectedToTime!.format(context)
                : "From Time",
            "number of seat": numberOfSeats.toString(),
            "occation": _occationontroller.text,
            "status" :"booked"
          }).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CustomText(text: "Table booked success!!", size: 20.spMin)));
              Navigator.pop(context);
          });
          
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                CustomText(text: "error while booking: $e", size: 20.spMin)));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Table Details",
          size: 21.spMin,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SizedBox(
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
                    height: 300.h,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: CustomTextFormField(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      filled: true,
                                      fillColor: myColor.fieldbackground,
                                      hintText: selectedDate != null
                                          ? DateFormat('dd-MM-yyyy')
                                              .format(selectedDate!)
                                          : 'select date',
                                      suffixIcon: IconButton(
                                          onPressed: datepicker,
                                          icon: Icon(
                                            IconlyLight.calendar,
                                            color: myColor.maincolor,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 160.w,
                                      child: DropdownButtonFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "select your category!";
                                          }
                                          return null;
                                        },
                                        items: type.map((String category) {
                                          return DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(category),
                                          );
                                        }).toList(),
                                        onChanged: (String? newvalue) {
                                          setState(() {
                                            selectedType = newvalue;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: myColor.fieldbackground,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          hintText: "Category",
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: CustomTextFormField(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      filled: true,
                                      fillColor: myColor.fieldbackground,
                                      hintText: selectedFromTime != null
                                          ? selectedFromTime!.format(
                                              context) // Format the time to display
                                          : "From Time",
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            timePicker(true);
                                          },
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
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      filled: true,
                                      fillColor: myColor.fieldbackground,
                                      hintText: selectedToTime != null
                                          ? selectedToTime!.format(
                                              context) // Format the time to display
                                          : "To Time",
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            timePicker(false);
                                          },
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
                                            onPressed: incrementSeats,
                                            icon: Icon(
                                              CupertinoIcons.plus_square_fill,
                                              color: myColor.maincolor,
                                              size: 30,
                                            )),
                                        CustomText(
                                            text: numberOfSeats.toString(),
                                            size: 22.spMin),
                                        IconButton(
                                            onPressed: decrementSeats,
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
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      filled: true,
                                      fillColor: myColor.fieldbackground,
                                      controller: _occationontroller,
                                      hintText: "occation..",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  myColor.tabcolor),
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                                  myColor.background),
                                          minimumSize:
                                              const WidgetStatePropertyAll(
                                                  Size(150, 45)),
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)))),
                                      onPressed: () {},
                                      child: CustomText(
                                          text: "Cancel", size: 20.spMin)),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  myColor.maincolor),
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                                  myColor.background),
                                          minimumSize:
                                              const WidgetStatePropertyAll(
                                                  Size(150, 45)),
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)))),
                                      onPressed: () async {
                                        await adddata();
                                      },
                                      child: CustomText(
                                          text: "Book Now", size: 20.spMin)),
                                ],
                              ),
                            )
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     // ElevatedButton(
                            //     //     onPressed: () => details(),
                            //     //     style: ButtonStyle(
                            //     //         backgroundColor:
                            //     //             WidgetStatePropertyAll(myColor.background),
                            //     //         foregroundColor:
                            //     //             WidgetStatePropertyAll(myColor.maincolor),
                            //     //         minimumSize:
                            //     //             WidgetStatePropertyAll(Size(160.w, 40.h))),
                            //     //     child: CustomText(text: "View Details", size: 20.spMin)),
                            //     Consumer<fadeAnimationProvider>(builder:
                            //         (context, fadeanimationProvider, child) {
                            //       return TextButton(
                            //           onPressed: () => details(),
                            //           child: AnimatedOpacity(
                            //             opacity: fadeanimationProvider.opacity,
                            //             duration: const Duration(seconds: 1),
                            //             child: CustomText(
                            //               text: "Click here for booking",
                            //               size: 21.spMin,
                            //               color: myColor.maincolor,
                            //               weight: FontWeight.w500,
                            //             ),
                            //           ));
                            //     })
                            //   ],
                            // ),
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
      ),
    );
  }
}
