import 'package:enduserapp/model/shop_model.dart';
import 'package:flutter/material.dart';

class ShopData extends ChangeNotifier{
  static List<ShopModel> shopList=[];

  List<ShopModel> get getShop{
    return shopList;
  }

  void addToShop(ShopModel shop){
    shopList.add(shop);
    notifyListeners();
  }

}