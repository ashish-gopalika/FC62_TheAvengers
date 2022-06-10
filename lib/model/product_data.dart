import 'package:enduserapp/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier{
  static List<ProductModel> productList=[ProductModel(productName: 'Med',uid: "shhsg",price: "876",description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",shop:"Saha Stores",rating: "3",image: "https://c8.alamy.com/comp/MHPBKR/a-pack-of-analgesic-and-antipyretic-drugs-with-active-ingredient-paracetamol-packaged-as-30-tablets-alvedon-500-mg-manufactured-by-astrazeneca-for-the-MHPBKR.jpg")];

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