import 'package:enduserapp/model/order_model.dart';
import 'package:flutter/foundation.dart';

class CartData extends ChangeNotifier{

  static List<OrderModel> cartItems=[];

  List<OrderModel> get getCartItems{
    return cartItems;
  }

  void addToCart(OrderModel newOrder){
    cartItems.add(newOrder);
    notifyListeners();
  }

  void removeFromCart(int index){
    cartItems.removeAt(index);
    notifyListeners();
  }

}