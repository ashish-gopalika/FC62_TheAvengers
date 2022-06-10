import 'package:enduserapp/model/order_model.dart';
import 'package:flutter/foundation.dart';

class OrderData extends ChangeNotifier{

  static List<OrderModel> orderItems=[];

  List<OrderModel> get getOrderItems{
    return orderItems;
  }

  void addToOder(OrderModel newOrder){
    orderItems.add(newOrder);
    notifyListeners();
  }

  void removeFromOder(int index){
    orderItems.removeAt(index);
    notifyListeners();
  }

}