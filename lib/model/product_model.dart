class ProductModel{
  String? uid;
  String? description;
  String? price;
  String? rating;
  String? category;
  String? image;
  String? shop;

  ProductModel({this.uid,this.description,this.price,this.shop,this.image,this.category,this.rating});

  //data from server
  factory ProductModel.fromMap(map){
    return ProductModel(
      uid: map['uid'],
      description: map['description'],
      price: map['price'],
      shop: map['shop'],
      image: map['image'],
      category: map['category'],
      rating: map['rating'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'description': description,
      'price': price,
      'shop': shop,
      'image': image,
      'category': category,
      'rating': rating,
    };
  }
}