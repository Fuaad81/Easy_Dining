import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userModel {
  String? name;
  String? email;
  String? number;
  String? address;

  userModel({
    this.name,
    this.email,
    this.number,
    this.address,
  });

  Future<void> fetchProfile() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    String? userid = sharedpref.getString("UserId");
    if (userid != null && userid.isNotEmpty) {
      try {
        DocumentSnapshot usersnap = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userid)
            .get();

        if (usersnap.exists) {
          name = usersnap["name"] ?? "null";
          email = usersnap["email"] ?? "null";
          number = usersnap["number"] ?? "null";
          // emailController = usersnap["email"] ?? "null";
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> updateUser()async{
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? uid = preferences.getString("UserId");
      await FirebaseFirestore.instance.collection("Users").doc(uid).update({
        "name" : name,
        "email" : email,
        "number": number
      });
    } catch (e) {
      print(e);
    }
  }
}
