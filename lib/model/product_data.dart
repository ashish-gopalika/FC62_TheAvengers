import 'package:enduserapp/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier{
  static List<ProductModel> productList=[];

  List<ProductModel> get getProductList{
    return productList;
  }

  void addToProductList(ProductModel newOrder){
    productList.add(newOrder);
    notifyListeners();
  }

  void removeFromProductList(int index){
    productList.removeAt(index);
    notifyListeners();
  }
}