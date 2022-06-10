import 'package:enduserapp/components/snack_bar_messages.dart';
import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/database/shared_preference_db.dart';
import 'package:enduserapp/model/shop_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class EmailAuth {

  static final _auth = FirebaseAuth.instance;

  static Future<bool> signUpWithEmail(String email, String password, String name, BuildContext context) async {
    bool state = false;
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
      FirestoreDB.postDetailsToFirestore(name),
      ScaffoldMessenger.of(context).showSnackBar(SnackBarMessages.successSignUpSnackBar),
      state = true,
    })
        .catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBarMessages.errorSnackBar);
      state = false;
    });
    return state;
  }

  static Future<bool> loginWithEmail(String email, String password, BuildContext context) async {
    bool state = false;
    User? user;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
      user=value.user,
    })
        .catchError((e) {
      state = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBarMessages.errorSnackBar);
    });
    await FirestoreDB.getEndUser(user?.uid).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBarMessages.successLoginSnackBar);
      state=true;
    });
    return state;
  }

  static determiningDelay() async{
    Future.delayed(const Duration(seconds: 2));
  }

  static Future<bool> signOut() async {
    bool state = false;
    SharedPreferenceDB.resetPreferences();
    ShopData.shopList.clear();
    await _auth.signOut();
    return state;
  }
}
