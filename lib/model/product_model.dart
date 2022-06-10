class ProductModel{
  String? uid;
  String? description;
  String? price;
  String? shop;

  ProductModel({this.uid,this.description,this.price,this.shop});

  //data from server
  factory ProductModel.fromMap(map){
    return ProductModel(
      uid: map['uid'],
      description: map['description'],
      price: map['price'],
      shop: map['shop'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'description': description,
      'price': price,
      'shop': shop,
    };
  }
}