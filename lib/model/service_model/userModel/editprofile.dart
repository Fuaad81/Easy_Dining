import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userModel {
  String? name;
  String? email;
  String? number;
  String? address;
  String? imageUrl; // New field for profile image URL

  userModel({
    this.name,
    this.email,
    this.number,
    this.address,
    this.imageUrl,
  });

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fetch user profile from Firebase
  Future<void> fetchProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
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
          imageUrl = usersnap["imageUrl"] ?? null; // Fetching image URL
        }
      } catch (e) {
        print(e);
      }
    }
  }

  // Update user profile in Firebase
  Future<void> updateUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection("Users").doc(user.uid).update({
          "name": name,
          "email": email,
          "number": number,
          "address": address,
          "imageUrl": imageUrl, // Update image URL in Firestore
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
