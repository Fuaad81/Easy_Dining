import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> fetchProfile() async {
    // SharedPreferences sharedpref = await SharedPreferences.getInstance();
    // String? userid = sharedpref.getString("UserId");
    User? user = _auth.currentUser;
    if (user != null ) {
      try {
        DocumentSnapshot usersnap = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get();

        if (usersnap.exists) {
          name = usersnap["name"] ?? "null";
          email = usersnap["email"] ?? "null";
          number = usersnap["number"] ?? "null";
          address = usersnap["address"] ?? "null";
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> updateUser()async{
    try {
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // String? uid = preferences.getString("UserId");
      User? user = _auth.currentUser;
      await FirebaseFirestore.instance.collection("Users").doc(user?.uid).update({
        "name" : name,
        "email" : email,
        "number": number,
        "address" :address
      });
    } catch (e) {
      print(e);
    }
  }
}
