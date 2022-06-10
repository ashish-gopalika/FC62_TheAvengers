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

  void updateAddQuantity(int index){
    cartItems[index].quantity=(int.parse(cartItems[index].quantity!)+1).toString();
    notifyListeners();
  }

  void updateDeleteQuantity(int index){
    cartItems[index].quantity=(int.parse(cartItems[index].quantity!)-1).toString();
    notifyListeners();
  }

  void removeFromCart(int index){
    cartItems.removeAt(index);
    notifyListeners();
  }

}