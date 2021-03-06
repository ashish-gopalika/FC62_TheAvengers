class EndUserModel{
  String? uid;
  String? email;
  String? name;
  String? image;
  String? phoneNumber;
  String? address;
  List<String>? orders;
  List<String>? cart;

  EndUserModel({this.uid,this.email,this.name,this.orders,this.phoneNumber,this.address,this.cart,this.image});

  //data from server
  factory EndUserModel.fromMap(map){
    return EndUserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      image: map['image'],
      phoneNumber: map['phoneNumber'],
      cart: map['cart'] is Iterable ? List.from(map['cart']) : null,
      address: map['addresses'],
      orders: map['orders'] is Iterable ? List.from(map['orders']) : null,
    );
  }

  //sending data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'addresses': address,
      'cart': cart,
      'orders': orders,
      'image': image,
    };
  }

}