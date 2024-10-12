import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_dine_in/model/Utils/widget/customcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:easy_dine_in/model/Utils/style/color.dart';
import 'package:easy_dine_in/model/Utils/widget/customtext.dart';

class user_Search extends StatefulWidget {
  const user_Search({super.key});

  @override
  State<user_Search> createState() => _user_SearchState();
}

class _user_SearchState extends State<user_Search> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Search", size: 21.spMin),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(0, 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 340.w,
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: myColor.fieldbackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    labelText: "search..",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18.spMin,
                      color: myColor.textcolor,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: const Icon(IconlyLight.search, size: 25),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase(); // Convert to lowercase for case-insensitive search
                    });
                  },
                  controller: _searchController,
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('addFood').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final results = snapshot.data?.docs ?? [];

          // Filter results where the searchQuery is found anywhere in the foodname
          final filteredResults = results.where((doc) {
            var foodname = doc['foodname'].toString().toLowerCase();
            return foodname.contains(searchQuery);
          }).toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 200.h,
            ),
            shrinkWrap: true,
            itemCount: filteredResults.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var data = filteredResults[index];
              return Padding(
                padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/user_fooddetails", arguments: {"data": data});
                  },
                  child: customCard(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: SizedBox(
                              width: 150.w,
                              height: 120.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                child: Image.network(
                                  data["imageurl"],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      IconlyBroken.image,
                                      size: 30,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: data["foodname"],
                                size: 18.spMin,
                                weight: FontWeight.w600,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 2.w),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    IconlyLight.heart,
                                    size: 22,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'quantity',
                                size: 14.spMin,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 7.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "₹${data["foodprize"]}",
                                size: 18.spMin,
                                weight: FontWeight.w600,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 2.w),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    IconlyLight.bag,
                                    size: 22,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
