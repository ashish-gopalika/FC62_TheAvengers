import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enduserapp/database/shared_preference_db.dart';
import 'package:enduserapp/model/address_model.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:enduserapp/model/end_user_model.dart';
import 'package:enduserapp/model/order_data.dart';
import 'package:enduserapp/model/order_model.dart';
import 'package:enduserapp/model/product_data.dart';
import 'package:enduserapp/model/product_model.dart';
import 'package:enduserapp/model/shop_data.dart';
import 'package:enduserapp/model/shop_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_data.dart';

class FirestoreDB{

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static int cartCount=0;

  //for creating a new user
  static postDetailsToFirestore(String name) async {
    User? user = _auth.currentUser;
    UserData.endUserModel.email = user!.email;
    UserData.endUserModel.uid = user.uid;
    UserData.endUserModel.name = name;
    UserData.endUserModel.phoneNumber='none';
    UserData.endUserModel.cart=[];
    UserData.endUserModel.address='none';
    UserData.endUserModel.orders = [];

    await firebaseFirestore
        .collection('end-users')
        .doc(user.uid)
        .set(UserData.endUserModel.toMap());
  }

  static Future<EndUserModel> getEndUser(String? uid) async{
    await firebaseFirestore
        .collection('end-users')
        .doc(uid)
        .get()
        .then((value) async {
          print(value.data());
          UserData.endUserModel=EndUserModel.fromMap(value.data());
          SharedPreferenceDB.setValue('uid',value.data()!['uid']);
          SharedPreferenceDB.setValue('email',value.data()!['email']);
          SharedPreferenceDB.setValue('name',value.data()!['name']);
          SharedPreferenceDB.setValue('phoneNumber',value.data()!['name']);
          SharedPreferenceDB.setValue('address',value.data()!['address']);
        return EndUserModel.fromMap(value.data());
    });
    return EndUserModel();
  }

  static Future<bool> loadProductByCategory(String category) async{
    bool state=false;
    CollectionReference cartCollectionRef = FirebaseFirestore.instance.collection('products');
    await cartCollectionRef.get().then((value){
      ProductData.productList.clear();
      print(value.docs.map((e) => ProductData.productList.add(ProductModel.fromMap(e.data()))));
      List<ProductModel> productList=[];
      if(ProductData.productList.isNotEmpty)
      {
        // print('user id= ${UserData.endUserModel.uid}');
        // print(CartData.cartItems.map((e) => e.uid));
        for (ProductModel item in ProductData.productList) {
          if (item.category==category) {
            // print('inside');
            productList.add(item);
          }
        }
        ProductData.productList = productList;
      }
      state=true;
    });
    return state;
  }

  static Future<bool> loadAssets(BuildContext context) async{
    bool state=false;
    CollectionReference shopCollectionRef = FirebaseFirestore.instance.collection('shop');
    await shopCollectionRef.get().then((value){
      ShopData.shopList.clear();
      print(value.docs.map((e) => ShopData.shopList.add(ShopModel.fromMap(e.data()))));
    });
    CollectionReference cartCollectionRef = FirebaseFirestore.instance.collection('cart');
    await cartCollectionRef.get().then((value){
      CartData.cartItems.clear();
      print(value.docs.map((e) => CartData.cartItems.add(OrderModel.fromMap(e.data()))));
      List<OrderModel> userCartList=[];
      cartCount=0;
      if(CartData.cartItems.isNotEmpty)
      {
        // print('user id= ${UserData.endUserModel.uid}');
        // print(CartData.cartItems.map((e) => e.uid));
        for (OrderModel item in CartData.cartItems) {
          if (item.uid!.contains(UserData.endUserModel.uid!)) {
            // print('inside');
            cartCount++;
            userCartList.add(item);
          }
        }
        CartData.cartItems = userCartList;
      }
    });
    CollectionReference ordersCollectionRef = FirebaseFirestore.instance.collection('orders');
    await ordersCollectionRef.get().then((value){
      OrderData.orderItems.clear();
      print(value.docs.map((e) => OrderData.orderItems.add(OrderModel.fromMap(e.data()))));
      List<OrderModel> userOrderList=[];
      if(OrderData.orderItems.isNotEmpty)
      {
        print('user id= ${UserData.endUserModel.uid}');
        // print(CartData.cartItems.map((e) => e.uid));
        for (OrderModel item in OrderData.orderItems) {
          if (item.uid!.contains(UserData.endUserModel.uid!)) {
            // print('inside');
            userOrderList.add(item);
          }
        }
        OrderData.orderItems = userOrderList;
      }

      state=true;
    });
    return state;
  }

  static void addToCart(OrderModel cartItem) async{
    await firebaseFirestore
        .collection('cart').doc(cartItem.uid).set(cartItem.toMap());
  }

  static void updateQuantity(OrderModel newModel) async{
    await firebaseFirestore
        .collection('cart').doc(newModel.uid!).set(newModel.toMap());
  }

  static void updateProfile(EndUserModel updatedUser) async{
    await firebaseFirestore
        .collection('end-users').doc(updatedUser.uid!).set(updatedUser.toMap());
  }

  static void removeFromCart(var itemID,BuildContext context,int index) async{
    print('deleting item ${itemID}');
    await FirebaseFirestore.instance.collection('cart').doc(itemID).delete().then((value) {
      Provider.of<CartData>(context, listen: false)
          .removeFromCart(index);
      print('item deleted');
    });
  }

  static Future<bool> deleteAccount(String id) async{
    bool state = false;
    SharedPreferenceDB.resetPreferences();
    await FirebaseFirestore.instance.collection('users').doc(id).delete().then((value) {state=true;});
    await FirebaseAuth.instance.currentUser!.delete();
    return state;
  }

  static void moveToOrders() async{
      for(var cart in CartData.cartItems) {
        firebaseFirestore
            .collection('orders').doc(cart.uid!+DateTime.now().toString()).set(cart.toMap());
        OrderData.orderItems.add(cart);
      }

      for(var cart in CartData.cartItems) {
        firebaseFirestore
            .collection('cart').doc(cart.uid).delete();
      }

  }

}