import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fc62_theavengers/database/shared_preference_db.dart';
import 'package:fc62_theavengers/model/end_user_model.dart';
import 'package:fc62_theavengers/services/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB{

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  //for creating a new user
  static postDetailsToFirestore(String name) async {

    User? user = _auth.currentUser;
    EmailAuth.endUserModel.email = user!.email;
    EmailAuth.endUserModel.uid = user.uid;
    EmailAuth.endUserModel.name = name;
    EmailAuth.endUserModel.phoneNumber='';
    EmailAuth.endUserModel.cart=[];
    EmailAuth.endUserModel.addresses=[];
    EmailAuth.endUserModel.orders = [];

    await firebaseFirestore
        .collection('end-users')
        .doc(user.uid)
        .set(EmailAuth.endUserModel.toMap());
  }

  static Future<EndUserModel> getEndUser(String? uid) async{
    await FirebaseFirestore.instance
        .collection('end-users')
        .doc(uid)
        .get()
        .then((value) async {
          print(value.data());
          EmailAuth.endUserModel=EndUserModel.fromMap(value.data());
          SharedPreferenceDB.setValue('uid',value.data()!['uid']);
          SharedPreferenceDB.setValue('email',value.data()!['email']);
          SharedPreferenceDB.setValue('name',value.data()!['name']);
          SharedPreferenceDB.setValue('phoneNumber','none');
        return EndUserModel.fromMap(value.data());
    });
    return EndUserModel();
  }

}